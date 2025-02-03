"""Module for updating package versions in container definition files.

This module provides functionality to automatically update package versions
in Containerfiles and Dockerfiles by querying DNF for the latest available
versions of packages in DNF repositories.
"""

from __future__ import annotations

import argparse
import logging
import re
import sys
import os

from pathlib import Path
from uuid import uuid4

import dnf
import dnf.exceptions
import dnf.repo
import dnf.repodict

CONTAINER_FILE_PATTERNS = ["Containerfile", "Dockerfile"]
REQUEST_TIMEOUT = 10  # seconds
DISTRO_CONFIGS = {
    "fedora": {
        "repo_baseurl": "https://download.fedoraproject.org/pub/fedora/linux",
        "repo_name": "fedora",
        "release_prefix": "fc",  # for package versions like xxx-1.fc41
        "url_structure": "releases/{version}/Everything/$basearch/os",
    },
    "centos": {
        "repo_baseurl": "https://mirror.centos.org/centos",
        "repo_name": "base",
        "release_prefix": "el",  # for package versions like xxx-1.el9
    },
    "almalinux": {
        "repo_baseurl": "https://repo.almalinux.org/almalinux",
        "repo_name": "baseos",
        "release_prefix": "el",
    },
    "rocky": {
        "repo_baseurl": "https://download.rockylinux.org/pub/rocky",
        "repo_name": "baseos",
        "release_prefix": "el",
    },
}

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def extract_base_image_info(content: str) -> tuple[str, str]:
    """Extract distribution version from FROM tag in Containerfile.

    Args:
        content (str): The content of the Containerfile to parse.

    Returns:
        tuple[str, str] | None: Tuple of (distro_name, version), or None if not found.
            distro_name can be: 'fedora', 'centos', 'almalinux', 'rocky'

    Raises:
        ValueError: If no supported distribution is found in the FROM directive.

    Example:
        >>> content = "FROM fedora:36"
        >>> extract_base_image_info(content)
        ('fedora', '36')
        >>> content = "FROM almalinux:9"
        >>> extract_base_image_info(content)
        ('almalinux', '9')

    """
    # Match common DNF distros
    patterns = {
        "fedora": r"^FROM\s+.*fedora:(\d+)",
        "centos": r"^FROM\s+.*centos:(\d+)",
        "almalinux": r"^FROM\s+.*almalinux:(\d+)",
        "rocky": r"^FROM\s+.*rockylinux:(\d+)",
    }

    for distro, pattern in patterns.items():
        if match := re.search(pattern, content):
            return (distro, match.group(1))

    msg = "No supported distribution found in FROM directive"
    raise ValueError(msg)


def get_latest_package_version(
    package_names: list[str],
    distro: str,
    release_ver: str,
) -> dict[str, str]:
    """Query DNF for the latest available version of packages.

    Args:
        package_names (list[str]): List of package names to query.
        distro (str): Distribution name ('fedora', 'centos', 'almalinux', 'rocky').
        release_ver (str): Distribution release version.

    Returns:
        dict[str, str]: Dictionary mapping package names to their latest versions.
            Empty dictionary if query fails.

    """
    versions = {}
    base = dnf.Base()
    conf = base.conf
    temp_repo_id = f"temp-{uuid4().hex[:8]}"

    try:
        # Initialize DNF configuration
        conf.read()  # Read DNF config
        conf.releasever = release_ver  # Set release version
        base.read_all_repos()  # Read repository information

        if distro_config := DISTRO_CONFIGS.get(distro):
            if distro == "fedora":
                baseurl = [
                    f"{distro_config['repo_baseurl']}/{distro_config['url_structure'].format(version=release_ver)}",
                ]
            else:
                baseurl = [
                    f"{distro_config['repo_baseurl']}/{release_ver}/BaseOS/$basearch/os",
                ]
            base.repos.add_new_repo(
                repoid=temp_repo_id,
                conf=conf,
                baseurl=baseurl,
                enabled=True,
            )

            try:
                base.fill_sack(load_system_repo=False)
            except dnf.exceptions.RepoError:
                logger.exception("Failed to fill DNF sack")
                return versions

            if base.sack is not None:  # Type check for sack
                query = base.sack.query()
                available = query.available().filter(name=package_names)
                latest = available.latest()

                for pkg in latest:
                    versions[pkg.name] = pkg.version

    except Exception:
        logger.exception("Error querying DNF for packages")
    finally:
        # Clean up the temporary repository if it exists
        if base.repos is not None and temp_repo_id in base.repos:
            try:
                base.repos[temp_repo_id].disable()
            except dnf.exceptions.RepoError as e:
                logger.warning(
                    "Failed to remove temporary repository %s: %s",
                    temp_repo_id,
                    str(e),
                )
        base.close()  # Clean up DNF resources

    return versions


def process_container_file(file_path: Path, pattern: str) -> None:
    """Process a single container file and update package versions.

    Reads the container file, extracts package information, queries DNF for
    latest versions, and updates the file with new package versions if needed.

    Args:
        file_path (Path): Path to the container definition file.
        pattern (str): Regular expression pattern for matching package versions.

    Returns:
        None

    Side Effects:
        - Reads from and potentially writes to the container file
        - Logs information about processing and updates

    """
    logger.info("Processing %s", file_path)
    content = file_path.read_text()
    updated_content = content

    try:
        distro, release_ver = extract_base_image_info(content)
    except ValueError:
        logger.exception("Could not determine distribution info")
        return

    packages = [match.group(1) for match in re.finditer(pattern, content)]

    if not packages:
        return

    versions = get_latest_package_version(packages, distro, release_ver)

    for match in re.finditer(pattern, content):
        package_name = match.group(1)

        if new_version := versions.get(package_name):
            old_package = match.group(0)
            new_package = f"{package_name}-{new_version}"
            updated_content = updated_content.replace(old_package, new_package)

    if updated_content != content:
        if not args.no_prompt and sys.stdin.isatty():
            response = input(f"Update {file_path}? (y/N): ").strip().lower()
            if response != "y":
                logger.info("Skipping update for %s", file_path)
                return
        file_path.write_text(updated_content)
        logger.info("Updated %s: %s", file_path, updated_content)


def update_container_files(search_path: Path | None = None) -> None:
    """Update package versions in all Containerfiles and Dockerfiles.

    Searches for container definition files recursively starting from the
    specified directory and updates package versions to their latest available
    versions.

    Args:
        search_path (Path | None): Directory to search in. If None, uses current
            working directory.

    Returns:
        None

    Side Effects:
        - Searches filesystem for container definition files
        - Processes and potentially modifies found files
        - Logs progress and any errors encountered

    """
    base_path = search_path or Path.cwd()
    logger.info("Searching in: %s", base_path.resolve())

    # Collect all container definition files
    container_files = []
    for pattern in CONTAINER_FILE_PATTERNS:
        container_files.extend(base_path.glob(f"**/{pattern}"))

    if not container_files:
        logger.info("No container definition files found")
        return

    pattern = r"([a-zA-Z0-9_-]+)-[\d.:]+(?=-*\d*\s|$)"

    try:
        for file_path in container_files:
            process_container_file(file_path, pattern)
    except OSError:
        logger.exception("Error processing files")


def parse_args() -> argparse.Namespace:
    """Parse command-line arguments for the package updater.

    Returns:
        argparse.Namespace: Parsed command-line arguments containing:
            - directory (Path): Directory to search for container files
            - debug (bool): Whether to enable debug logging

    """
    parser = argparse.ArgumentParser(
        description="Update package versions in container files.",
    )
    parser.add_argument(
        "-d",
        "--directory",
        type=Path,
        help="Directory to search for container files (default: current directory)",
    )
    parser.add_argument(
        "--debug",
        action="store_true",
        help="Enable debug logging",
    )
    parser.add_argument(
        "--no-prompt",
        action="store_true",
        help="Skip prompting for confirmation before writing changes",
    )
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)

    update_container_files(args.directory)

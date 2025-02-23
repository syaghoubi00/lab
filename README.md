# Homalab IaC

A collection of things I use for my homelab infrastructure as code

## Usage

**Install `ansible` roles**:

`ansible-galaxy install -r requirements.yaml`

## Roadmap

- [ ] Migrate from CoreDNS to bind9 (no DDNS support for DHCP)

  - [ ] Create lab bind9 config

- [ ] Create ansible role for isc-kea-dhcp

- [ ] Configure DDNS between Kea and Bind

### CI/CD

- Pushing a change to `containers/**` triggers a rebuilding of all containers,
  should only rebuild changed files, and let the scheduler rebuild the rest

  - Thoughts: Remove push/pull paths in main build-containers workflow and
    create a separate workflow for on changes

- perf: instead of scanning the image - build the sbom that can be reused

- chore(ci.containers): separate pr scanning and release build/scans

- Containerfiles should have their pinned versions updated before doing a build

- Create reusable workflows for building containers/images

### Scripts

- Show a changelog of what was updated, dnf - `dnf updateinfo list`; should be
  added to pr/commit in workflow

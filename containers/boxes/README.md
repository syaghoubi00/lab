# Development Toolbox Containers 🛠️

## Overview 📋

[Toolbox](https://github.com/containers/toolbox) is a utility for creating
isolated development environments using containers. This repository contains my
personal development container configurations, enabling:

- 🔄 Multiple versions of the same software without conflicts
- 🧹 Clean host system maintenance
- 🎯 Project-specific dependency management

> **Note**: While [Distrobox](https://github.com/89luca89/distrobox) is a
> popular alternative, these containers are primarily tested with Toolbox.

## Why Use Development Containers? 🤔

### Benefits

1. **Isolation**

   - Separate development dependencies from host system
   - Prevent package conflicts
   - Easy cleanup when no longer needed

2. **Reproducibility**

   - Consistent development environment across machines
   - Version-controlled container definitions
   - Easy onboarding for new team members

3. **Flexibility**
   - Switch between different tool versions
   - Test applications in different environments
   - Experiment without affecting host system

## Getting Started 🚀

### Prerequisites

- Container runtime (podman/docker)
- Toolbox or Distrobox installed
- Basic understanding of containers

### Basic Usage

```bash
# Create a new development toolbox named "devtools"
toolbox create --image ghcr.io/syaghoubi00/boxes-fedora:latest devtools

# Enter the toolbox
toolbox enter devtools

# Remove a toolbox
podman stop devtools && podman rm devtools
```

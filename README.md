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

  - Thoughts: Remove push/pull paths in main build-containers workflow and create
    a separate workflow for on changes

- Multiple images are getting pushed to `ghcr`, with an `unknown/unknown` platform
  - need to find out why and fix

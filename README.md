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

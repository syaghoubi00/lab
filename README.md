# Homalab IaC

A collection of things I use for my homelab Infrastructure as Code

## Usage

`./deploy.sh`:

1. Applies Terraform (`./terraform/`)
2. Checks SSH Connectivity to Hosts (`./inventory.yaml`)
3. Installs Ansible requirements to this repo (`./requirements.yaml` to
   `./ansible_collections`)
4. Runs Ansible Playbook (`./playbook.yaml`)

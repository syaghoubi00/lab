# Homalab IaC

Infrastructure as Code (IaC).

## Usage

1. Install Ansible requirements/dependencies:

`ansible-galaxy install -r requirements.yml`

2. Run the playbook:

`ansible-playbook -i inventory playbook.yaml`

This will:

1. Install requirements
2. Run `playbook.yaml`, which will provision and configure the Infrastructure.

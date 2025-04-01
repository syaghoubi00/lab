# Homalab IaC

Infrastructure as Code (IaC).

## Usage

`ansible-playbook -i inventory deploy.yaml`

This will:

1. Install requirements
2. Import `playbook.yaml`
3. `playbook.yaml` will provision and configure IaC

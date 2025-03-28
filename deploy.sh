#!/bin/sh

TF_CMD="/usr/bin/terraform"
TF_DIR="terraform"

echo "=== Terraform ==="
"$TF_CMD" -chdir="$TF_DIR" apply || exit 1

# BUG: Need to check if SSH is ready before running ansible
# for host in $ANSIBLE_INVENTORY; do
#   while false; do
#     echo "Waiting for SSH on $host..."
#     sleep 5
#     nc -zv "$host" 22
#   done
# done

echo "=== Ansible ==="
# TODO: Use custom collection path
echo "Installing Ansible collections..."
ansible-galaxy collection install -r requirements.yaml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.yaml playbook.yaml

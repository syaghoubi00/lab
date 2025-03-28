#!/bin/sh

TF_CMD="/usr/bin/terraform"
TF_DIR="terraform"

echo "=== Terraform ==="
"$TF_CMD" -chdir="$TF_DIR" apply || exit 1

# BUG: Need to check if SSH is ready before running ansible
# for host in $ANSIBLE_INVENTORY; do
#   SSH_PORT=22
#   while false; do
#     echo "Waiting for SSH on $host..."
#     sleep 5
#     nc -zv -w 1 "$host" "$SSH_PORT"
#   done
# done

echo "=== Ansible ==="
# TODO: Use custom collection path
echo "Installing Ansible collections..."
ansible-galaxy collection install -r requirements.yaml
SSH_AUTH_SOCK="" ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.yaml playbook.yaml

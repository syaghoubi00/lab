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
export ANSIBLE_COLLECTIONS_PATH="./tmp"  # Set local collection path
export SSH_AUTH_SOCK=""                  # Disable SSH agent
export ANSIBLE_HOST_KEY_CHECKING="False" # No TOFU

echo "Installing Ansible collections..."
ansible-galaxy collection install -r requirements.yaml

ansible-playbook -i inventory.yaml playbook.yaml

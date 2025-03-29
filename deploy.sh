#!/bin/sh

TF_CMD="/usr/bin/terraform"
TF_DIR="terraform"

echo "=== Terraform ==="
"$TF_CMD" -chdir="$TF_DIR" apply || exit 1

echo "=== SSH ==="
HOSTS=$(ansible-inventory -i inventory.yaml --list | jq -r '._meta.hostvars | keys[]')

check_ssh() {
  host=$1
  port=22
  nc -z -w 1 "$host" "$port" 2>/dev/null
  return $?
}

for host in $HOSTS; do
  echo "Checking SSH on $host..."

  for attempt in $(seq 1 5); do
    if check_ssh "$host"; then
      echo "SSH on $host is ready."
      break
    else
      echo "Attempt $attempt: Waiting for SSH on $host..."
      sleep 5
    fi

    if [ "$attempt" -eq 3 ]; then
      echo "SSH on $host is not ready after 3 attempts. Exiting."
      exit 1
    fi
  done
done

echo "=== Ansible ==="
export ANSIBLE_COLLECTIONS_PATH="./tmp"  # Set local collection path
export SSH_AUTH_SOCK=""                  # Disable SSH agent
export ANSIBLE_HOST_KEY_CHECKING="False" # No TOFU

echo "Installing Ansible collections..."
ansible-galaxy collection install -r requirements.yaml

ansible-playbook -i inventory.yaml playbook.yaml

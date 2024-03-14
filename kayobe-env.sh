#!/bin/bash

source /home/cloud-user/src/kayobe-config/kayobe-env --environment training
source /home/cloud-user/venvs/kayobe/bin/activate

export TENKS_CONFIG_PATH=/home/cloud-user/src/kayobe-config/etc/kayobe/environments/training/tenks.yml
export KAYOBE_CONFIG_SOURCE_PATH=/home/cloud-user/src/kayobe-config
export KAYOBE_VENV_PATH=/home/cloud-user/venvs/kayobe

# Check if a password file exists within the 'cloud-user' home directory. If it does, export the contents as the Kayobe vault password environment variable.
if [[ ! -f /home/cloud-user/vault.pass ]]; then
    echo "Vault password file 'vault.pass' not found in /home/cloud-user/"
    exit 1
else
    export KAYOBE_VAULT_PASSWORD=$(cat /home/cloud-user/vault.pass)
fi
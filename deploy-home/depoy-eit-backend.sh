#!/bin/bash

# Deployment script in the deployment user's home dir.
# SSH authorized_keys line: command="./deploy-studlan.sh $SSH_ORIGINAL_COMMAND" ssh-rsa <pubkey>
# Sudoer line: deploy ALL=(root) NOPASSWD: <script>

set -eu

if (( $# == 0 )); then
    echo "No target specified." 1>&2
    exit -1
elif [[ $1 == "bleeding" ]]; then
    sudo -H /srv/eit-backend/remote-deploy.sh
else
    echo "Unknown target specified." 1>&2
    exit -1
fi

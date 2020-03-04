#!/bin/bash

# Deployment script in the deployment user's home dir.
# SSH authorized_keys line: command="./deploy-eit.sh $SSH_ORIGINAL_COMMAND" ssh-rsa <pubkey>

set -eu

if (( $# == 0 )); then
    echo "No target specified." 1>&2
    exit -1
elif [[ $1 == "bleeding" ]]; then
    sudo -H /srv/eit/remote-deploy.sh
else
    echo "Unknown target specified." 1>&2
    exit -1
fi

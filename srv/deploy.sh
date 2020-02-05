#!/bin/bash

# Deployment script for eit-backend.
# Must be called with the app dir as the PWD.

LOCK_DIR="deploy.lock"

PATH="$PATH:/usr/local/bin"

# Exit on error and error on undefined var
set -eu

# mkdir uses atomic check-and-create
if ! mkdir $LOCK_DIR 2>/dev/null; then
  echo "Warning: Another app deployment for this instance is already running, returning instead" 1>&2
  exit -1
fi

trap "rm -rf $LOCK_DIR" EXIT

echo "Pulling images ..."
docker-compose pull --quiet

echo "Recreating containers ..."
docker-compose up -d --force-recreate --quiet-pull --no-color

echo "Fixing permissions ..."
./fix-permissions.sh

#!/bin/bash

# Remote deployment script for eit-backend.

APP_DIR="/srv/eit"
LOG_FILE="log/remote-deploy.log"

set -eu

cd "$APP_DIR"

mkdir -p "$(dirname $LOG_FILE)"

#./backup.sh > $LOG_FILE 2>&1

./deploy.sh > $LOG_FILE 2>&1

#!/bin/bash

# Remote deployment script for eit-backend.

LOG_FILE="log/remote-deploy.log"

set -eu

mkdir -p $(dirname $LOG_FILE)

#./backup.sh > $LOG_FILE 2>&1

./deploy.sh > $LOG_FILE 2>&1

#!/bin/bash

# Fixes permissions for eit-backend.
# Use 0600 (rw) for most files and 0700 (rwx) for most folders.

# Base dir
chown root:root .
chmod 0700 .

# Main scripts
chown root:root *.sh
chmod 0700 *.sh

# DB stuff, DB data dir inside
mkdir -p db
chown root:root db
chmod 0700 db

# Public web docs, accessable by nginx
mkdir -p doc
chown -R eit-backend:eit-backend doc
chmod 0755 doc

# App logs
mkdir -p log
chown -R eit-backend:eit-backend log
chmod 0700 log

# DC file
chown root:root docker-compose.yml
chmod 0600 docker-compose.yml

# App/Django settings
chown eit-backend:eit-backend settings.py
chmod 0600 settings.py

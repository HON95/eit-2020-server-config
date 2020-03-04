#!/bin/bash

# Fixes permissions for eit back-end and front-end.
# Use 0600 (rw) for most files and 0700 (rwx) for most folders.

# Base dir
chown root:root .
chmod 0700 .

# Main scripts
chown root:root *.sh
chmod 0700 *.sh

# DB stuff, DB data dir inside
#mkdir -p db
#chown root:root db
#chmod 0700 db

# Backend and frontend dirs
mkdir -p backend
mkdir -p frontend

# DB file
touch backend/db.sqlite3
chown eit:eit backend/db.sqlite3
chmod 0600 backend/db.sqlite3

# Certs
mkdir -p certs
chown -R eit:eit certs
chmod 0700 certs

# Backend Public web docs, accessable by nginx
mkdir -p backend/www
chown -R eit:eit backend/www
chmod 0755 backend/www

# App logs
mkdir -p log
chown -R eit:eit log
chmod 0700 log

# DC file
chown root:root docker-compose.yml
chmod 0600 docker-compose.yml

# Back-end settings
touch backend/settings.py
chown eit:eit backend/settings.py
chmod 0600 backend/settings.py

# Front-end settings
touch frontend/config.js
chown eit:eit frontend/config.js
chmod 0666 frontend/config.js

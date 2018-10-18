#!/bin/bash
mkdir /recovery
cp cron.sh /recovery
cd /recovery
mkdir logs
mkdir backups
adduser recovery --disabled-password --no-create-home --gecos ""
adduser recovery sudo
chown -R recovery /recovery
crontab -u recovery -e

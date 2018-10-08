#!/bin/bash
mkdir logs
mkdir backups
adduser recovery --disabled-password --no-create-home --gecos ""
adduser recovery sudo
crontab -u recovery -e

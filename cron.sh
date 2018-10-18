#!/bin/bash

exec &> "/recovery/logs/backup`date +%Y-%m-%d_%H-%M-%S`.log"
tar --exclude='/recovery' --exclude='/proc' --exclude='/dev'--exclude='/snap' --exclude='/sbin' --exclude='/run' --exclude='/lib' --exclude='lib32' --exclude='/sys' --exclude='/tmp' --exclude='/var/lib'  --exclude='/boot' -cvpPzf "/recovery/backups/backup`date +%Y-%m-%d_%H-%M-%S`.taz.gz" /*
onedrive -v --syncdir="/recovery"
rm -f /recovery/backups/*

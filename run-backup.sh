#!/bin/bash
wall -n 'Complete server backup starting now...'
(sudo nohup tar --exclude='/recovery' --exclude='/proc' --exclude='/dev' --exclude='/boot' -cvpPzf "/recovery/backups/backup`date +%Y-%m-%d_%H-%M-%S`.taz.gz" /* && wall 'Complete server backup done.') &> "logs/backup`date +%Y-%m-%d_%H-%M-%S`.log"&


#!/bin/bash

# create backup filename w/date
filename="bk_globetrotters_backup_$(TZ=":US/Eastern" date +%Y%m%d).tar.gz"

# halt all servers
sudo /opt/bitnami/ctlscript.sh stop
# archive site
sudo tar -pczvf ~/backup_scripts/$filename /opt/bitnami
# restart servers
sudo /opt/bitnami/ctlscript.sh start

# upload to S3 and delete file
python ~/backup_scripts/backup.py

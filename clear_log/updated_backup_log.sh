#!/bin/bash
echo "This is Script create logs backeup Then clear all logs from /var/log/"
read -p "Do you want to continue? (y/N): " confirm

confirm=${confirm,,}

if [[ "$confirm" != "y" ]]; then
    echo "❌ Operation cancelled by user."
    exit 1

fi

backupFolder=/home/LogBackups
sudo mkdir -p $backupFolder
cd $backupFolder

old_logs=$(sudo find /var/log -type f -mtime +7)
  
#If there are old log files
if [[ -n "$old_logs" ]]; then

	archive_name="backupLogs-$(date +%Y%m%d-%H%M%S).tar.gz"
	echo "This is backeup logsfile Name: $archive_name"

	sudo tar -czvf "$archive_name" $old_logs
	echo "your backup folder is created on: $backupFolder"
	echo "your file name is: $archive_name"

	#This is deleting Old logs
	sudo rm -f $old_logs
	echo "Old Log files are successfully Deleted"
else
	echo "There is no logs for more then 7 dyas"
fi


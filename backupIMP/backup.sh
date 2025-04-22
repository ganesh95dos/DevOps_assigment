#Back up important directories in a compressed format to prevent data loss.
#!/bin/bash
echo "Please run this script from that folder that you want backup"
read -p "Press ONLY Enter if you want create backup (If press anything else will cancel): " confirm

# If any input is entered, exit
if [[ -n "$confirm" ]]; then
    echo " You didn't press Enter. Script has been Exiting."
    exit 1
fi

echo "This script is for Back up important directories in a compressed format to prevent data loss."

backupPath=$(pwd)
echo "this is your current path that all Directorys you want backup: $backupPath"

read -p "Do you want to continum: (y/N)" confirm

confirm=${confirm,,}
if [[ "$confirm" != "y" ]];then
	echo "As per your selection we exit without any taking Backup"
	exit 1
fi

sudo mkdir -p /home/backupIMPDirectory

#cBackuppath="/home/backupIMPDirectorys"

archive_name="backupDir-$(date +%Y%m%d-%H%M%S).tar.xz"
sudo tar -czvf "$archive_name" "$backupPath"
echo "This is your Compress file name: $archive_name"

sudo mv -f "$archive_name" /home/backupIMPDirectory/

#echo "$cBackuppath"
echo "This is your tar folder Path: /home/backupIMPDirectory"









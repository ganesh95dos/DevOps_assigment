#Keep systems up-to-date by automating package updates and upgrades.
#!/bin/bash

echo "This script Keep systems up-to-date by automating package updates."
confirm=${confirm,,}

read -p "Please enter Y for update and N for abort: (y/N)" confirm
if [[ $confirm != "y" ]]; then
	echo "You abourt update script Exit"
	exit 1
fi
sudo apt-get update 

echo "This script Keep systems automating package upgrades."
confirm=${confirm,,}

read -p "Please enter Y for update and N for abort: (y/N)" confirm
if [[ $confirm != "y" ]]; then
        echo "You abourt update script Exit"
        exit 1
fi
#sudo apt-get upgrade


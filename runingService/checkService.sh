#!/bin/bash

# List of critical services to monitor
service=("ssh" "ufw" "cron" "rsyslog" "NetworkManager" "ufw" "rsyslog" "systemd-journald" "systemd-logind" "auditd" "clamav-daemon" "docker" "jenkins" "mysql" "nginx")

#checking if service is active or not
for service in "${service[@]}"; do
    systemctl is-active --quiet "$service"

    if [ $? -ne 0 ]; then
        echo "This Service is not Running: $service"
	echo "Trying to restart..."
        sudo systemctl start "$service"

        # Check again after restart attempt
        if systemctl is-active --quiet "$service"; then
            echo "This is service restart successfully: $service"
        else
            echo "We Failed to restart This Service: $service."
	    echo "Please Try start Manual to this service!!!$service"
        fi
    else
        echo "$service is running."
    fi
done

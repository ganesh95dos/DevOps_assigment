#Monitor disk usage and receive alerts before running out of space.
#!/bin/bash

echo "This Script for Monitor disk usage and receive alerts before running out of space."
THRESHOLD=80
USAGE=$(df --output=pcent / | tail -n 1 | tr -dc '0-9')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
	echo "Warning Disk Usage $USAGE%"
else
	echo "Disk Usage is: $USAGE%"
fi

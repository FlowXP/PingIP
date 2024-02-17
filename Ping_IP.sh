#!/bin/bash

# Check if an IP parameter is provided
if [ -z "$1" ]; then
  read -p "Enter the IP address to ping: " ip_to_ping
else
  ip_to_ping="$1"
fi

# Set the log file path
log_file="$(dirname "$0")/Result.txt"

# Main loop to ping the IP address
while true; do
  if ping -c 1 -W 5 "$ip_to_ping" &> /dev/null; then
    # Connection successful
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Connection successful to $ip_to_ping"
  else
    # Connection timeout
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Connection timeout to $ip_to_ping" >> "$log_file"
  fi

  # Adjust the sleep duration based on how frequently you want to ping (in seconds)
  sleep 1
done

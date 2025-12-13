#!/bin/bash

LOG_FILE="/var/log/simple_check.log"
REQUIRED_FILE="/Library/ManagedPreferences/com.lab.example.txt"

echo "$(date) - Script started" >> "$LOG_FILE"

# Ensure directory exists
if [ ! -d "/Library/ManagedPreferences" ]; then
    mkdir -p /Library/ManagedPreferences
    chmod 755 /Library/ManagedPreferences
fi

# Check if file exists
if [ ! -f "$REQUIRED_FILE" ]; then
    echo "$(date) - Required file missing. Creating it." >> "$LOG_FILE"
    echo "Managed by endpoint automation" > "$REQUIRED_FILE"
    chmod 644 "$REQUIRED_FILE"
else
    echo "$(date) - Required file already exists." >> "$LOG_FILE"
fi

echo "$(date) - Script completed" >> "$LOG_FILE"

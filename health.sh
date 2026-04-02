#!/bin/bash

# load config file
source config.conf

echo "===================================" | tee -a "$LOG_FILE"
echo "       SYSTEM HEALTH REPORT         " | tee -a "$LOG_FILE"
echo "Run at: $(date '+%Y-%m-%d %H:%M:%S')" | tee -a "$LOG_FILE"
echo "===================================" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"

echo "1. Available RAM:" | tee -a "$LOG_FILE"
free -h | awk 'NR==2 {print $7}' | tee -a "$LOG_FILE"

echo "-----------------------------------" | tee -a "$LOG_FILE"

echo "2. Available Disk Space:" | tee -a "$LOG_FILE"
df -h | awk 'NR==2 {print $4}' | tee -a "$LOG_FILE"

echo "................." | tee -a "$LOG_FILE"

echo "3. Top Memory Consuming Process:" | tee -a "$LOG_FILE"
ps aux --sort=-%mem | awk 'NR==2 {print "User:", $1, "| PID:", $2, "| Usage:", $4"%"}' | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"

echo "=========== END OF REPORT ==========" | tee -a "$LOG_FILE"

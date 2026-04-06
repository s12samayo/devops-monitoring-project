#!/bin/bash
echo "=====SYSTEM HEALTH CHECK====="
date
#CPU
echo "CPU load:"
top -bn1 | grep "load average"

#Memory
echo "memory Usage:"
free  -h
#Disk
echo "Disk Usage:"
df -h
# Alert example
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
if [ "$CPU" -gt 80 ]; then
    echo "WARNING: High CPU usage!"
    fi
    echo "=====end of check====="

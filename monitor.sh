#!/bin/bash
echo "=====SYSTEM HEALTH CHECK====="
date
echo

echo "CPU Load:"
uptime

echo
echo "Memory Usage:"
free -h

echo
echo "Disk Usage:"
df -h

echo
echo "==============================="

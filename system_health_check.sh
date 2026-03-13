#!/bin/bash
echo "CPU Load:"; uptime 
echo -e "\n Memory Usage:"; free -m
echo -e "\n Disk Usage:" ; df -h 
echo -e "\n Top 5 memory consuming processes:"; ps -aux --sort=-%mem | head -6

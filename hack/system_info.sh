#!/bin/bash

# Sample script written for Part 4 of the RHCE series
# This script will return the following set of system information:
# -Hostname information:
echo -e "***** HOSTNAME INFORMATION ***** "
hostnamectl
echo ""
# -File system disk space usage:
echo -e "***** FILE SYSTEM DISK SPACE USAGE(df -h) ***** "
df -h
echo ""
# -Free and used memory in the system:
echo -e "  ***** FREE AND USED MEMORY(free -m) ***** "
free -m
echo ""
# -System uptime and load:
echo -e "***** SYSTEM UPTIME AND LOAD(uptime) ***** "
uptime
echo ""
# -Top 5 processes as far as memory usage is concerned
echo -e "***** TOP 5 MEMORY-CONSUMING PROCESSES ***** "
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo -e " Done. "

# -OS information
echo -e "***** OS INFORMARTION ***** "
cat /etc/os-release
echo ""
echo -e " Done. "

# -Kernal parameters
echo -e "***** KERNEL PARAMETERS (cmdline) ***** "
cat /proc/cmdline
echo ""
echo -e " Done. "

# -docker version
echo -e "***** ALL DOCKER INFO ***** "
docker info
echo ""
echo -e " Done. "

# -CPU info:
echo -e "***** CPU information ***** "
lscpu
echo ""
echo ""
cat /proc/cpuinfo
echo ""

# -dmesg
echo -e "***** DMESG ***** "
dmesg -T
echo ""
echo -e " Done. "
echo ""
echo ""
echo -e "***** CLUSTER INFORMATION STARTS HERE ***** "
echo  ""
echo  ""
# -docker images
echo -e "***** ALL DOCKER IMAGES ***** "
docker images
echo ""
echo -e " Done. "

# -pods
echo -e "***** ALL PODS ***** "
kubectl get po --all-namespaces
echo ""
echo -e " Done. "

# -docker containers
echo -e "***** ALL DOCKER CONTAINERS ***** "
docker ps -a
echo ""
echo -e " Done. "

# -cm
echo -e "***** ALL CM ***** "
for i in `kubectl get cm -n kube-system | tail -n +2 | awk '{print $1}'`;do echo -n "********* CM  $i **********";echo "";kubectl get cm -n kube-system  $i -o yaml ;echo "";done
echo ""
echo -e " Done. "

# -ds
echo -e "***** ALL DS ***** "
for i in `kubectl get ds -n kube-system | tail -n +2 | awk '{print $1}'`;do echo -n "********* DS  $i **********";echo "";kubectl get ds -n kube-system  $i -o yaml ;echo "";done
echo ""
echo -e " Done. "

# -services
echo -e "***** ALL SERVICES ***** "
for i in `kubectl get services -n kube-system | tail -n +2 | awk '{print $1}'`;do echo -n "********* SERVICES  $i **********";echo "";kubectl get services -n kube-system  $i -o yaml ;echo "";done
echo ""
echo -e " Done. "

# -pod describe
echo -e "***** ALL PODS ***** "
for i in `kubectl get po -n kube-system | tail -n +2 | awk '{print $1}'`;do echo -n "********* PODS  $i **********";echo "";kubectl get po -n kube-system  $i -o yaml ;echo "";done
echo ""
echo -e " Done. "




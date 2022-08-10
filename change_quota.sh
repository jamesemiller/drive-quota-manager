#!/bin/bash

# simple script to reset the file quota for an external 
# drive labelled "USB"

# exit when any command fails
set -e

# elevate to sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# turn quota off
quotaoff /mnt/USB

# initialize user quota
quotacheck -cu /mnt/USB

# set user quota. values in 1KB blocks
# usage: https://linuxhint.com/disk_quota_ubuntu/ , https://manpages.ubuntu.com/manpages/bionic/man1/quota.1.html
# setquota [USER] [soft limit blocks] [hard limit blocks] [soft limit num files] [hard limit num files] [/filepath]
setquota james 0 15 0 0 /mnt/USB
quotaon  /mnt/USB


#!/bin/sh

ARCHITECTURE="$(arch)"

echo "This is beeing executed on: \""$ARCHITECTURE"\""
cat /proc/cpuinfo
cat /proc/sys/user/max_mnt_namespaces
#!/bin/sh

ARCHITECTURE="$(arch)"

echo "This was build at $1"
echo "This is beeing executed on: \""$ARCHITECTURE"\""
echo "nproc:" $(nproc)
cat /proc/meminfo | grep MemTotal:
uname -a

echo "max_mnt_namespaces:" $(cat /proc/sys/user/max_mnt_namespaces)
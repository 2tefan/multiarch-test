#!/bin/sh

ARCHITECTURE="$(arch)"

echo "This is beeing executed on: \""$ARCHITECTURE"\""
echo "nproc:" $(nproc)
cat /proc/meminfo | grep MemTotal:

echo "max_mnt_namespaces:" $(cat /proc/sys/user/max_mnt_namespaces)
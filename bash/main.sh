#!/bin/sh

echo "I am alive! $(date)"
ARCHITECTURE="$(arch)"

echo "This is beeing build on: \"$ARCHITECTURE\""
echo "\$TARGETPLATFORM = \"$TARGETPLATFORM\""
echo "\$BUILDPLATFORM = \"$BUILDPLATFORM\""

#!/bin/bash

API_SOCKET="/tmp/firecracker.socket"

# Remove API Unix socket if it exists
if [ -e "$API_SOCKET" ]; then
  rm -f "$API_SOCKET"
  echo "Removed existing API Unix socket: $API_SOCKET"
fi

./firecracker --api-sock "$API_SOCKET"

echo "Firecracker is running with API socket: $API_SOCKET"

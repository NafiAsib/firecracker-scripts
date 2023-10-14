#!/bin/bash

chmod +x get-files.sh
chmod +x get-firecracker-binary.sh
chmod +x create-socket.sh

sudo setfacl -m u:${USER}:rw /dev/kvm

./get-files.sh

# Check if get-files.sh completed successfully
if [ $? -eq 0 ]; then
  # Run the get-firecracker-binary.sh script
  ./get-firecracker-binary.sh

  # Check if get-firecracker-binary.sh completed successfully
  if [ $? -eq 0 ]; then
    # Run the create-socket.sh script
    ./create-socket.sh
  else
    echo "get-firecracker-binary.sh script failed. Aborting..."
  fi
else
  echo "get-files.sh script failed. Aborting..."
fi

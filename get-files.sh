#!/bin/bash

ARCH="$(uname -m)"

kernel_url="https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.5/${ARCH}/vmlinux-5.10.186"
rootfs_url="https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.5/${ARCH}/ubuntu-22.04.ext4"
ssh_key_url="https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.5/${ARCH}/ubuntu-22.04.id_rsa"

download_if_not_exists() {
  local url="$1"
  local filename="$2"
  if [ ! -e "$filename" ]; then
    wget "$url" -O "$filename"
  else
    echo "$filename already exists. Skipping download."
  fi
}

# Download the Linux kernel binary if it doesn't exist
download_if_not_exists "$kernel_url" "vmlinux-5.10.186"

# Download the rootfs if it doesn't exist
download_if_not_exists "$rootfs_url" "ubuntu-22.04.ext4"

# Download the SSH key for the rootfs if it doesn't exist
download_if_not_exists "$ssh_key_url" "ubuntu-22.04.id_rsa"

# Set user read permission on the SSH key
chmod 400 ./ubuntu-22.04.id_rsa

echo "Downloaded rootfs, kernel and SSH key..."

#!/bin/bash
set -euo pipefail

NEW_DOCKER_DIR="/home/docker"
OLD_DOCKER_DIR="/var/lib/docker"

echo "[+] Stopping Docker..."
sudo systemctl stop docker.service docker.socket

echo "[+] Creating new directory at $NEW_DOCKER_DIR"
sudo mkdir -p "$NEW_DOCKER_DIR"

echo "[+] Copying Docker data (this may take a while)..."
sudo rsync -aP "$OLD_DOCKER_DIR/" "$NEW_DOCKER_DIR/"

echo "[+] Backing up old Docker dir..."
sudo mv "$OLD_DOCKER_DIR" "${OLD_DOCKER_DIR}.old"

echo "[+] Creating symlink..."
sudo ln -s "$NEW_DOCKER_DIR" "$OLD_DOCKER_DIR"

echo "[+] Configuring Docker daemon.json..."
sudo mkdir -p /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "data-root": "$NEW_DOCKER_DIR"
}
EOF

echo "[+] Starting Docker..."
sudo systemctl daemon-reexec
sudo systemctl start docker
sudo systemctl enable docker

echo "[+] Checking..."
docker info | grep "Docker Root Dir"

echo "[✓] If everything works, you can safely remove the backup:"
echo "    sudo rm -rf ${OLD_DOCKER_DIR}.old"

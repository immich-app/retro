#!/bin/sh

# List of Docker image tags (space-separated)
# ML is excluded since it requires internet to download models
images="
ghcr.io/immich-app/immich-server:v1.137.3
docker.io/valkey/valkey:8-bookworm
ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0
"

# Pull each image sequentially
for img in $images; do
  echo "Pulling $img..."
  docker pull "$img"
done

echo "All images pulled successfully."
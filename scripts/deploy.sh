#!/bin/sh

echo "🧹 Cleaning up temp directory"
rm -rf /tmp/pride-background-generator

echo "📦 Downloading the latest"
git clone --depth 1 https://github.com/NicholeMattera/Pride-Background-Generator.git /tmp/pride-background-generator
cd /tmp/pride-background-generator

echo "🛠️ Building"
docker compose build --no-cache

echo "🪦 Bringing down and removing old container"
docker container stop pride-background-generator-web-1
docker container rm pride-background-generator-web-1

echo "💡 Bringing up new container"
docker compose up --detach

echo "🧹 Cleaning up old images and temp directory"
docker image prune --all --force
rm -rf /tmp/pride-background-generator

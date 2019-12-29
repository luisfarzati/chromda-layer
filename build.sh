#!/usr/bin/env bash -e

echo "Downloading dependencies..."
npm install --production --no-bin-links --no-optional --no-package-lock

echo "Packaging..."
mkdir -p export
rm -rf export/layer.zip
zip -yr export/layer.zip nodejs >/dev/null

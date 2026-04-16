#!/bin/bash
# Basic usage examples for compress tool

echo "=== Compress Tool Examples ==="

# Create test directory
mkdir -p test-data
echo "Hello, World!" > test-data/file1.txt
echo "This is a test file" > test-data/file2.txt

echo "1. Creating ZIP archive..."
./scripts/compress.sh compress test-data/ test-data.zip

echo "2. Creating TAR.GZ archive..."
./scripts/compress.sh compress test-data/ test-data.tar.gz tar.gz

echo "3. Listing ZIP contents..."
./scripts/compress.sh list test-data.zip

echo "4. Extracting ZIP archive..."
./scripts/compress.sh extract test-data.zip extracted/

echo "5. Cleaning up..."
rm -rf test-data test-data.zip test-data.tar.gz extracted/

echo "Done!"
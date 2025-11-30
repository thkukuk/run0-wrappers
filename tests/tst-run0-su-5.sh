#!/bin/sh

LANG=C.UTF-8

# Test 5: Help and version
echo -e "\nTest 5: Help and version commands"
if ./run0-su --help | grep -i -q "usage:" && ./run0-su --version | grep -q "^run0-su"; then
    echo "✓ PASS: Help and version commands work"
else
    echo "✗ FAIL: Help and version commands failed"
    exit 1
fi

#!/bin/sh

LANG=C.UTF-8

# Test 6: Help and version
echo -e "\nTest 6: Help and version commands"
if ./run0-sudo --help | grep -q "usage:" && ./run0-sudo --version | grep -q "^run0-sudo"; then
    echo "✓ PASS: Help and version commands work"
else
    echo "✗ FAIL: Help and version commands failed"
    exit 1
fi

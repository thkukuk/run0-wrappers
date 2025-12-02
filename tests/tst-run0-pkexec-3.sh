#!/bin/sh

LANG=C.UTF-8

# Test 3: pkexec should not change the directory
echo "Test 3: Stay in the current directory"
if ./run0-pkexec --keep-cwd pwd | grep -q "^$(pwd)$"; then
    echo "✓ PASS: run0-pkexec did not change the directory"
else
    echo "✗ FAIL: run0-pkexec did change the directory"
    exit 1
fi


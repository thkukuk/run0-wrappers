#!/bin/sh

LANG=C.UTF-8

# Test 2: pkexec should change to new home directory
echo "Test 2: Change to home directory"
if ./run0-pkexec pwd | grep -q "^/root$"; then
    echo "✓ PASS: run0-pkexec changed to home directory"
else
    echo "✗ FAIL: run0-pkexec did not change to home directory"
    exit 1
fi


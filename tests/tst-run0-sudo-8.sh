#!/bin/sh

LANG=C.UTF-8

# Test 8: Error handling for missing arguments
echo -e "\nTest 8: Error handling for missing arguments"
if ./run0-sudo -u 2>&1 | grep -q "option requires an argument" && ./run0-sudo -u 2>&1 | grep -q "usage:"; then
    echo "✓ PASS: Missing arguments are properly handled"
else
    echo "✗ FAIL: Missing argument handling failed"
    exit 1
fi

#!/bin/sh

LANG=C.UTF-8

# Test 7: Error handling for invalid options
echo -e "\nTest 7: Error handling for invalid options"
if ./run0-sudo -X 2>&1 | grep -q "invalid option" && ./run0-sudo -X 2>&1 | grep -q "usage:"; then
    echo "✓ PASS: Invalid options are properly handled"
else
    echo "✗ FAIL: Invalid option handling failed"
    exit 1
fi

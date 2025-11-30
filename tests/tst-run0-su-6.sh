#!/bin/sh

LANG=C.UTF-8

# Test 6: Error handling for invalid options
echo -e "\nTest 6: Error handling for invalid options"
if ./run0-su -X 2>&1 | grep -i -q "invalid option" && ./run0-su -X 2>&1 | grep -i -q "for more information"; then
    echo "✓ PASS: Invalid options are properly handled"
else
    echo "✗ FAIL: Invalid option handling failed"
    exit 1
fi

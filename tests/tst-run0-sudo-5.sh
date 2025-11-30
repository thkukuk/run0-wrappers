#!/bin/sh

LANG=C.UTF-8

# Test 5: User switching
echo -e "\nTest 5: User switching (-u)"
if ./run0-sudo -u nobody whoami | grep -q "nobody"; then
    echo "✓ PASS: User switching works"
else
    echo "✗ FAIL: User switching failed"
    exit 1
fi

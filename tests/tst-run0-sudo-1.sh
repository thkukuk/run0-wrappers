#!/bin/sh

LANG=C.UTF-8

# Test 1: Basic functionality
echo "Test 1: Basic privilege escalation"
if ./run0-sudo whoami | grep -q "root"; then
    echo "✓ PASS: Basic sudo functionality works"
else
    echo "✗ FAIL: Basic sudo functionality failed"
    exit 1
fi


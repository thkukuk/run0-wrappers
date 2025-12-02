#!/bin/sh

LANG=C.UTF-8

# Test 1: Basic functionality
echo "Test 1: Basic privilege escalation"
if ./run0-pkexec whoami | grep -q "root"; then
    echo "✓ PASS: Basic run0-pkexec functionality works"
else
    echo "✗ FAIL: Basic run0-pkexec functionality failed"
    exit 1
fi


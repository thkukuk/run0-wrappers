#!/bin/sh

LANG=C.UTF-8

# Test 1: Basic functionality
echo "Test 1: Basic privilege escalation"
if ./run0-su -c whoami | grep -q "root"; then
    echo "✓ PASS: Basic su functionality works"
else
    echo "✗ FAIL: Basic su functionality failed"
    exit 1
fi


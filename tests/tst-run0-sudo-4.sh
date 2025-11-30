#!/bin/sh

LANG=C.UTF-8

# Test 4: Login shell functionality
echo -e "\nTest 4: Login shell functionality (-i)"
shell_output=$(./run0-sudo -i printenv SHELL HOME 2>/dev/null | head -2)
if echo "$shell_output" | grep -q "^/bin/bash" && echo "$shell_output" | grep -q "^/root"; then
    echo "✓ PASS: Login shell sets correct SHELL and HOME"
else
    echo "✗ FAIL: Login shell functionality failed"
    exit 1
fi

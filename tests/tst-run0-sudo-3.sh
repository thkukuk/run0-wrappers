#!/bin/sh

LANG=C.UTF-8

# Test 3: Specific environment variable preservation
echo -e "\nTest 3: Specific environment variable preservation"
TEST1="value1"
TEST2="value2"
export TEST1 TEST2
if ./run0-sudo --preserve-env=TEST1,TEST2 printenv | grep -q "TEST1" && \
   ./run0-sudo --preserve-env=TEST1,TEST2 printenv | grep -q "TEST2"; then
    echo "✓ PASS: Specific environment variable preservation works"
else
    echo "✗ FAIL: Specific environment variable preservation failed"
    exit 1
fi

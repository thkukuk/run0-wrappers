#!/bin/sh

LANG=C.UTF-8

# Test 4: Specific environment variable preservation
echo -e "\nTest 4: Specific environment variable preservation"
TEST1="value1"
TEST2="value2"
export TEST1 TEST2
if ./run0-su -l -w TEST1,TEST2 -c printenv | grep -q "TEST1" && \
   ./run0-su -l -w TEST1,TEST2 -c printenv | grep -q "TEST2"; then
    echo "✓ PASS: Specific environment variable preservation works"
else
    echo "✗ FAIL: Specific environment variable preservation failed"
    exit 1
fi

#!/bin/sh

LANG=C.UTF-8

# Test 2: Environment variable preservation
echo -e "\nTest 2: Environment variable preservation (-E)"
TEST_VAR="test123"
export TEST_VAR
if ./run0-sudo -E printenv TEST_VAR | grep -q "test123"; then
    echo "✓ PASS: Environment variable preservation works"
else
    echo "✗ FAIL: Environment variable preservation failed"
    exit 1
fi

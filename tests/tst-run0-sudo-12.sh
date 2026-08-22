#!/bin/sh

LANG=C.UTF-8

# Test 12: -E must not choke on bash-exported shell functions
# Bash exports shell functions as environment entries named
# "BASH_FUNC_<name>%%" with the function body as the value. Such names
# are not valid environment variable identifiers and must be skipped
# instead of being passed on to run0's --setenv, which would abort with
# "Invalid argument".

echo -e "\nTest 12: -E ignores bash-exported shell functions"
TEST_VAR="test123"
export TEST_VAR
# shellcheck disable=SC2317
mc() { :; }
export -f mc

if ./run0-sudo -E printenv TEST_VAR | grep -q "test123"; then
    echo "✓ PASS: -E still preserves normal variables with a shell function exported"
else
    echo "✗ FAIL: -E failed while a shell function was exported"
    exit 1
fi

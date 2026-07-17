#!/bin/sh

LANG=C.UTF-8

# Test 11: VAR=value environment variable assignments before command

echo "Test 11: Single VAR=value assignment before command"
output=$(./run0-sudo AAA=aaa printenv AAA 2>/dev/null)
if [ "$output" = "aaa" ]; then
    echo "✓ PASS: Single VAR=value assignment works"
else
    echo "✗ FAIL: Single VAR=value assignment failed (got: '$output')"
    exit 1
fi

echo ""
echo "Test 11: Multiple VAR=value assignments before command"
output=$(./run0-sudo AAA=aaa BBB=bbb bash -c 'echo "$AAA $BBB"' 2>/dev/null)
if [ "$output" = "aaa bbb" ]; then
    echo "✓ PASS: Multiple VAR=value assignments work"
else
    echo "✗ FAIL: Multiple VAR=value assignments failed (got: '$output')"
    exit 1
fi

echo ""
echo "Test 11: VAR=value with empty value"
output=$(./run0-sudo AAA= printenv AAA 2>/dev/null)
if [ "$output" = "" ]; then
    echo "✓ PASS: VAR= (empty value) assignment works"
else
    echo "✗ FAIL: VAR= (empty value) assignment failed (got: '$output')"
    exit 1
fi

echo ""
echo "Test 11: VAR=value combined with -u option"
output=$(./run0-sudo -u root AAA=hello printenv AAA 2>/dev/null)
if [ "$output" = "hello" ]; then
    echo "✓ PASS: VAR=value combined with -u option works"
else
    echo "✗ FAIL: VAR=value combined with -u option failed (got: '$output')"
    exit 1
fi

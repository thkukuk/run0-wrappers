#!/bin/sh

LANG=C.UTF-8

# Test 10: -k and -K credential revocation options

echo "Test 10: -k exits successfully without a command"
if ./run0-sudo -k; then
    echo "✓ PASS: -k exits with 0"
else
    echo "✗ FAIL: -k did not exit with 0"
    exit 1
fi

echo ""
echo "Test 10: --reset-timestamp exits successfully without a command"
if ./run0-sudo --reset-timestamp; then
    echo "✓ PASS: --reset-timestamp exits with 0"
else
    echo "✗ FAIL: --reset-timestamp did not exit with 0"
    exit 1
fi

echo ""
echo "Test 10: -K exits successfully without a command"
if ./run0-sudo -K; then
    echo "✓ PASS: -K exits with 0"
else
    echo "✗ FAIL: -K did not exit with 0"
    exit 1
fi

echo ""
echo "Test 10: --remove-timestamp exits successfully without a command"
if ./run0-sudo --remove-timestamp; then
    echo "✓ PASS: --remove-timestamp exits with 0"
else
    echo "✗ FAIL: --remove-timestamp did not exit with 0"
    exit 1
fi

echo ""
echo "Test 10: -K with a command is rejected"
if ./run0-sudo -K whoami 2>&1 | grep -q "cannot be used with a command"; then
    echo "✓ PASS: -K with command is properly rejected"
else
    echo "✗ FAIL: -K with command was not rejected"
    exit 1
fi

echo ""
echo "Test 10: -k with a command runs the command"
if ./run0-sudo -k whoami | grep -q "root"; then
    echo "✓ PASS: -k with command runs the command"
else
    echo "✗ FAIL: -k with command did not run the command"
    exit 1
fi

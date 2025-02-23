#!/bin/bash

# This script demonstrates a corrected version of the previous script, avoiding the race condition.

# Create two files
touch file1.txt
touch file2.txt

# Check if files exist before running processes
if [ -f file1.txt ] && [ -f file2.txt ]; then
  # Run two processes concurrently. One process writes to file1.txt and the other checks if file2.txt exists.
  ( while true; do echo "Hello" >> file1.txt; sleep 1; done ) &
  pid=$!
  if [ -f file2.txt ]; then
    echo "file2.txt exists"
  else
    echo "file2.txt does not exist"
  fi
  # Kill the background process
  kill $pid
else
  echo "Error: Files not created"
fi
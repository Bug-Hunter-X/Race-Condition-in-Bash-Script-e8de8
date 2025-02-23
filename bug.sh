#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Run two processes concurrently. One process writes to file1.txt and the other checks if file2.txt exists.
# The race condition occurs if the second process runs before the first process creates the files.
( while true; do echo "Hello" >> file1.txt; sleep 1; done ) & 
pid=$!
if [ -f file2.txt ]; then
  echo "file2.txt exists"
else
  echo "file2.txt does not exist"
fi

# Kill the background process
kill $pid
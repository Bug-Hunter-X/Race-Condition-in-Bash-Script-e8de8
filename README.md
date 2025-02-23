# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  The script creates two files and then runs two processes concurrently. One process writes to `file1.txt`, while the other checks for the existence of `file2.txt`. The race condition occurs if the second process executes before the first one creates the files. This can lead to unpredictable behavior and errors.

## Bug Description
The script suffers from a race condition because the order of execution of the two processes is not guaranteed.  This means that the process checking for `file2.txt` might run before `file1.txt` and `file2.txt` are created, resulting in incorrect output.

## Solution
The solution involves using proper synchronization mechanisms to ensure that the processes execute in the correct order. This could involve using semaphores or other inter-process communication mechanisms.  However, a simpler solution in this case is to ensure that the file creation happens before the concurrent check occurs.
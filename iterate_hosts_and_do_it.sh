#!/bin/bash
###If you have 50 typical hosts you can do like this
for i in {01..50}; do
    ssh root@your-typical-hostname-${i}.net "cat /etc/passwd"
done

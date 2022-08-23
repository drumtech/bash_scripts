#!/bin/bash
### var a take path to file
a=$1
### var b take only size in digit
b=`ls -la $a | awk '{print $5}'`

### and condition if digit more than 1024 it's FAIL  if less 1024 it's OK
if [[ b -le 1024 ]]
then
	echo OK
else
	echo FAIL
fi

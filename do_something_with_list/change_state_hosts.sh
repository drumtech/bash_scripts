#!/bin/bash
LIST=./list.txt
while IFS= read -r line
do
   cmdbng update -c server "$line" set state=production -y
done < $LIST

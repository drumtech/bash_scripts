#!/bin/bash
LIST=./list.txt
while IFS= read -r line
do
   cmdbng search -c server "$line"
done < $LIST

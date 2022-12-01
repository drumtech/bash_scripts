#!/bin/bash
STROKA="BrokenPipeError"
LOG=logs/your_app_worker.log
#launch check this script
if pidof -x $(basename $0) > /dev/null; then
   for p in $(pidof -x $(basename $0)); do
   if [ $p -ne $$ ]; then
   echo "Script $0 is already running: exiting"
    exit
   fi
   done
fi


tail -f $LOG | while read y
do
	if [[ "$y" == *"$STROKA"* ]]; then
		cd ~/app/bin/ && source ./activate && ./supervisorctl -c ~/conf/supervisord/supervisord.conf restart your_app_worker &> /dev/null
	else
		continue
	fi
done


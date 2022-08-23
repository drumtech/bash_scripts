#!/bin/bash
time_begin=1400
time_end=1500
time_now=`date +"%H%M"`
DIR=/var/lib/backup
REMOVE_AFTER=30
IMPORTANT_DATA=/etc/*


backup () {

### Checking the correct time to make a backup
	if [[ 10#"$time_begin" -le 10#"$time_now" ]] && [[ 10#"$time_now" -le 10#"$time_end" ]]
	then
### Doing backup	
		tar -czvf /var/lib/backup/etc-backup-$(date +%Y-%m-%d).tar.gz $IMPORTANT_DATA
	else
		echo Keep calm and waiting for your time
	fi
}


### Checking the existence of a directory for our backup (if it absent make it)

if [ -d $DIR ]
then
	echo Path is correct
	backup
else
	echo Unknown directory I\'ll make it
	mkdir -p /var/lib/backup
	backup
fi

###Find old and kill it
find /var/lib/backup/ -mtime +$REMOVE_AFTER -delete

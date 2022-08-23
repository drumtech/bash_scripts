# send_notification.sh
This script counts how much time is left before changing the password. If less than two weeks sends a notification to your Teams channel.

# iterate_hosts_and_do_it.sh
Iterate through typical hosts and do some your command

# size_of_file.sh
Takes the path to the file as argument and if file more than 1024 byte return FAIL, if less than 1024 byte return OK

# bash_func.sh
Unziped archive and find something inside, take two arguments

# do_backup.sh
You can set time and script will check it, if this is not the right time script won't work. Then scrip will check path to backup, if path is absence it will make it and do backup all contain in etc.
Also script will clean backup files older than 30 days.
You can change right time, path to backup, data for backup and how long you want to save backup files.
And one little notification. Interval of right time not quite right, because if you setting app time begin is 1470 the script will never be executed.
Time format:
- first two digit is hours in 24 format
- second two digit(minutes) can't be more than 59

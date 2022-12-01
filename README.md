# send_notification.sh
This script counts how much time is left before changing the password. If less than two weeks sends a notification to your Teams channel.

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

# vertuhai
This script watch for your worker and restart it if the condition is triggered

*How can you check that it works?*
1. In first window you can run simple script from this repository with name random_string.sh this script generates random strings in logs/your_app_worker.log
2. In second window you can run script from this repository with name vertuhai.sh (but change the main command which start supervisor restart to a simple one, for example ls -la)
3. And finally do this in third window
```
echo BrokenPipeError: bla bla bla 123 >> logs/your_app_worker.log

```

And you'll see result in the second window. The script will work in any line where it finds BrokenPipeError.
And of course, don't forget to change your paths that match your system parameters.

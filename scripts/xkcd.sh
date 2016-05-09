#!/bin/bash

cd /home/bk
#/usr/local/bin/xkcd-dl --update-db  > /dev/null
#/usr/local/bin/xkcd-dl --download-all > /dev/null
/home/bk/Documents/xkcd-dl/xkcd_dl/cli.py  --update-db > /dev/null
/home/bk/Documents/xkcd-dl/xkcd_dl/cli.py  --download-all > /dev/null
count=$(/bin/ls /home/bk/xkcd_archive/ | /usr/bin/wc -l)
/bin/echo "Updated database"
/bin/echo "Currently $count comics in db"
last=$(/bin/ls /home/bk/xkcd_archive | /usr/bin/sort  -n | /usr/bin/tail -1)
/bin/echo "Latest comic is $last"
/usr/bin/notify-send "Updated xkcd database. Latest comic is $last."

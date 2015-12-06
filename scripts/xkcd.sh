#!/bin/bash

cd ~;
xkcd-dl --update-db > /dev/null;
xkcd-dl --download-all > /dev/null;
cd xkcd_archive;
count=$(ls | wc -l)
echo "Updated database"
echo "Currently $count comics in db"
last=$(ls | sort  -n | tail -1)
echo "Latest comic is $last"

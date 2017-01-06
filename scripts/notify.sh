/usr/bin/notify-send "$(shuf -n 1 /home/bk/.dotfiles/scripts/questions.txt)" -i "/home/bk/.dotfiles/scripts/icons/$(/bin/ls /home/bk/.dotfiles/scripts/icons/ | /usr/bin/shuf -n 1)"

##########
# Aliases#
##########


# Navigation
alias cdht="cd ~/Documents/Persona-BitBucket/httpd"
alias cdv="cd ~/Documents/vendingmachine"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias dot="cd ~/.dotfiles/"
alias exer="cd ~/exercism"
alias mk="mkdir"
alias ..="cd .."

# Find a running process
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Powerline
alias power="cd ~/.local/lib/python2.7/site-packages/powerline"
alias repower="powerline-daemon -k;sleep 2; powerline-daemon -q"

# Search command history
alias histg="history | grep"

# Duh
alias bashrf="source ~/.bashrc"
alias batt="cat /sys/class/power_supply/BAT0/capacity"
alias btcprice="echo $(curl -s https://btc-e.com/api/2/btc_usd/ticker | json_pp | grep last | cut -d : -f 2 | tr -d ,| tr -d ' ')"
alias c="clear"
alias checkkarma="bash ~/.scripts/checkkarma"
alias grepc="grep --color=always" 
alias listwifi="sudo iwlist wlan0 scan | sift -e ESSID -e Address -e Quality -e Encryption | head -32"
alias localip="ifconfig | grep -A3 wlan0 | grep \"inet \" | sed -e 's/^[[:space:]]*//' | cut -d \" \" -f2 | cut -d : -f2"
alias localipv6="ifconfig | grep -A3 wlan0 | grep inet6 | sed -e 's/^[[:space:]]*//' | cut -d \" \" -f3"
alias myip="curl https://v4.ifconfig.co"
alias myipv6="curl https://v6.ifconfig.co"
alias pingtest="ping -c 5 google.com"

# Spread sheet calculator
alias sc="sc-im"

# mutt open gmail bh directly
alias muttg="mutt -F ~/.mutt/muttgrc"

# ls variations
alias la="ls -a"
alias llg="ll | grep -i $1"
alias lag="ls -a | grep -i $1"
alias lsg="ls | grep -i $1"
alias lsc="ls --color=always"
alias lsag="ls -a | grep "
alias mygit="mygit | column -t"

# ncmpcpp
alias nvis="ncmpcpp -s visualizer"
alias nclk="ncmpcpp -s clock"

# Change mouse buttons
alias mouseright="xmodmap -e \"pointer = 3 2 1\""
alias mouseleft="xmodmap -e \"pointer = 1 2 3\"" 

# Move mouse out of the way
alias nomouse="xdotool mousemove 0 100"

# Log current ip address (both external and local, ipv4 only)
alias ipsave="/home/bk/.scripts/ipsave"

# Show last 10 used ipaddresses
alias tailip="tail ~/.ip.log"

# Set or get background opacity in gnome-terminal
alias setb="gconftool-2 -s -t float /apps/gnome-terminal/profiles/Default/background_darkness "
alias getb="gconftool-2 -g /apps/gnome-terminal/profiles/Default/background_darkness"

# mpc
alias mpstat='mpc status; echo -n "Rated: "; echo "$(mpd-rate)/5"'
alias vol="mpc -q volume"
alias rate="mpd-rate $1"
alias mpd="mpd && mpd-dynamic"

# Enable float values. Keeps me sane
alias bc="bc -l"

# xkcd
# Refresh xkcd archive
# alias xkcd="/home/bk/.scripts/xkcd.sh"
# Obsoleted by a cron job
# Still the same script but manual invocation is not needed anymore.
alias cdx="cd /home/bk/xkcd_archive"

# sifting through the xkcd archive
alias xkcg="sift -ir $1 /home/bk/xkcd_archive"

# Last xkcd comic
alias lastx="ls /home/bk/xkcd_archive/ | sort -n | tail -1"

# Welcome script
alias welcome="/home/bk/.scripts/welcome.sh"

# Botched the installation of weechat. FML
alias weechat="/usr/bin/bin/weechat"

# easier invocation
alias lines="wc -l" 

# Neat little script I found. Credits in file
alias remme="/home/bk/.scripts/remme"
alias suspend="/home/bk/.scripts/suspend"

# Prevent Oh $#!7 moments
alias rm="rm -i"
alias mv="mv -i"

# Returns world population at the moment
alias pop="curl -s http://www.census.gov/popclock/data/population/world | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[\"world\"][\"population\"]'"

# List all alis
# Most of it is to make it look pretty. Show heading columns, numbers and colors
alias listall="echo -e '\e[31m\e[1mNo.\tAlias\t\tCommand\e[0m';grep alias ~/.bashrc |cut -d' ' -f2- | sed 's/\=/\t\t/g' | nl -w 2"

# Edit this file
alias edalias="vim ~/.bashrc"

# Edit git configs and shortcuts
alias edgit="vim ~/.gitconfig"
alias gstat="git status"

# Useful apt get shortcuts
alias aptget="sudo apt-get"
alias autoremove="sudo apt-get autoremove"
alias autoclean="sudo apt-get autoclean"
alias install="sudo apt-get install $1"
alias remove="sudo apt-get remove $1"
alias update="sudo apt-get update && sudo apt-get upgrade"

# List functions
alias listfun="cat ~/.bashrc | grep function | cut -c 9-  "

# some utilities
# alias bb2internet="~/.scripts/connect-bb-internet"
alias cc="xclip -selection clipboard /dev/null" #Clear clipboard

# lsrc is from rcm, a dotfile managing utility
alias lsrc="lsrc | sed 's/:/ -> /g'"

#weather
alias weather=". /home/bk/.scripts/ansiweather/ansiweather -F"

alias processing="~/Downloads/processing*/processing-java"

# Endal


###########
# Functions#
###########
function mcd () {	#make and cd
    mkdir -p $1
    cd $1
}


function extract {	#universal extract
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.lzma)      unlzma $1      ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x -ad $1 ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}


if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

function _update_ps1() {
   export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

# function weather(){ curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-<YOURZIPORLOCATION>}"|perl -ne '/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
export TERM="xterm-256color"

function mygit() {
	list="$(ls -1)";
	#echo "$list"
	echo "" > /tmp/tmpgitlist
	for i in $list; do
		str=""
		if [ -d $i/.git ] ;
		then
			branch=$(git --git-dir="$i"/.git symbolic-ref --short HEAD);
			url=$(cat "$i"/.git/config | grep url | cut -d "=" -f 2);
			echo "$i ($branch) $url" >> /tmp/tmpgitlist;
		else echo -n ;
		fi
	done
	cat /tmp/tmpgitlist | grep -v ^git | grep -v ^http://// | column -t;
	rm -f /tmp/tmpgitlist
}

##########################
# DBUS session Bus address
# This is for cron to push a notification to the x
##########################
touch $HOME/.dbus/Xdbus
chmod 600 $HOME/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
echo "export DBUS_SESSION_BUS_ADDRESS" >> $HOME/.dbus/Xdbus

/home/bk/.scripts/ipsave
export RTV_EDITOR=vim

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/rvm/bin" # Add RVM to PATH for scripting

# Relates to vimrc mods from Damian conway
export MYVIMRC="/home/bk/.vimrc"

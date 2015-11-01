#########
#Aliases#
#########

#Navigation
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias sphero="cd ~/Documents/sphero"
alias ..="cd .."
alias power="cd ~/.local/lib/python2.7/site-packages/powerline"
alias dot="cd ~/.dotfiles/"
alias mk="mkdir"
alias cdht="cd ~/Documents/Persona-BitBucket/httpd"

#Find a running process
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias ps="ps auxf"

#Search command history
alias histg="history | grep"

#Duh
alias myip="curl http://ipecho.net/plain; echo"
alias pingtest="ping -c 5 google.com"
alias localip="ifconfig | grep -A3 wlan0 | grep \"inet \" | sed -e 's/^[[:space:]]*//' | cut -d \" \" -f2 | cut -d : -f2"
alias localipv6="ifconfig | grep -A3 wlan0 | grep inet6 | sed -e 's/^[[:space:]]*//' | cut -d \" \" -f3"
alias bashrf="source ~/.bashrc"
alias c="clear"
alias la="ls -a"
alias lsg="ls | grep -i $1"
alias llg="ll | grep -i $1"
alias lag="ls -a | grep -i $1"
alias beagle="ssh root@beaglebone.local"
alias beaglet="ssh root@beaglebone.local -t tmux a"
alias lsc="ls --color=always"
alias grepc="grep --color=always" 
alias checkkarma="bash ~/.scripts/checkkarma"
alias listwifi="sudo iwlist wlan0 scan | sift -e ESSID -e Address -e Quality -e Encryption | head -32"
alias nvis="ncmpcpp -s visualizer"
alias nclk="ncmpcpp -s clock"
alias mouseright="xmodmap -e \"pointer = 3 2 1\""
alias mouseleft="xmodmap -e \"pointer = 1 2 3\"" 
alias ipsave="/home/bk/.scripts/ipsave"
alias tailip="tail ~/.ip.log"

#Returns world population at the moment
alias pop="curl -s http://www.census.gov/popclock/data/population/world | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[\"world\"][\"population\"]'"

#List all alis
#Most of it is make it look pretty. Show heading columns, numbers and colors
alias listall="echo -e '\e[31m\e[1mNo.\tAlias\t\tCommand\e[0m';cat ~/.bashrc | grep alias |cut -d' ' -f2- | sed 's/\=/\t\t/g' | nl -w 2"

#Edit this file
alias edalias="vim ~/.bashrc"
#Edit git configs and shortcuts
alias edgit="vim ~/.gitconfig"

#Useful apt get shortcuts
alias aptget="sudo apt-get"
alias update='sudo apt-get update;  sudo apt-get upgrade'
alias install="sudo apt-get install $1"
alias remove="sudo apt-get remove $1"
alias autoremove="sudo apt-get autoremove"
alias autoclean="sudo apt-get autoclean"

#List functions
alias listfun="cat ~/.bashrc | grep function | cut -c 9-  "

#Tmux
alias twork="tmuxp load ~/.tmuxp/work-small-full.yaml"

#task utils
alias taskhome="clear; task list proj:Home"
alias taskwork="clear; task list proj:Work"
alias bb2internet="~/.scripts/connect-bb-internet"
alias repower="powerline-daemon -k;sleep 2; powerline-daemon -q"
alias cc="xclip -selection clipboard /dev/null" #Clear clipboard

#lsrc is from rcm, a dotfile managing utility
alias lsrc="lsrc | sed 's/:/ -> /g'"
alias setnwid="tmux resize-pane -x 44; ncmpcpp -s visualizer"
alias setnhgt="tmux resize-pane -y 15; ncmpcpp -s clock"

#Endal



###########
#Functions#
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

#function weather(){ curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-<YOURZIPORLOCATION>}"|perl -ne '/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';}


export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
export TERM="xterm-256color"




############################
#Arduino variables - Global#
############################

export ARDUINO_DIR=/usr/bin/arduino

export RTV_EDITOR=vim

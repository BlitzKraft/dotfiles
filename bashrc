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

#Find a running process
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias ps="ps auxf"

#Search command history
alias histg="history | grep"

#Duh
alias myip="curl http://ipecho.net/plain; echo"
alias pingtest="ping -c 5 google.com"
alias bashrf="source ~/.bashrc"
alias c="clear"
alias lsg="ls | grep -i $1"
alias llg="ll | grep -i $1"
alias lag="ls -a | grep -i $1"
alias cc="xclip -selection clipboard /dev/null" #Clear clipboard
alias beagle="ssh root@beaglebone.local"

#List all aliases
#Most of it is make it look pretty. Show heading columns, numbers and colors
alias listall="echo -e '\e[31m\e[1mNo.\tAlias\t\tCommand\e[0m';cat ~/.bashrc | grep alias |cut -d' ' -f2- | sed 's/\=/\t\t/g' | nl -w 2"

#Edit alias file
alias edalias="vim ~/.bashrc"

#Useful apt get aliases
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


if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

function _update_ps1() {
   export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
export TERM="xterm-256color"

############################
#Arduino variables - Global#
############################

export ARDUINO_DIR=/usr/bin/arduino



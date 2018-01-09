# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

##########
# Aliases#
##########

# Navigation
alias gits="cd /mnt/storage/gits"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias dot="cd ~/.dotfiles"
alias exer="cd ~/exercism"
alias mk="mkdir"
alias ..="cd .."
alias vimrc="vim ~/.vimrc"

# Find a running process
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Powerline
alias power="cd /usr/lib64/python2.7/site-packages/powerline"
alias repower="powerline-daemon -k;sleep 2; powerline-daemon -q"

# Search command history
alias histg="history | grep"

# Duh
alias bashrf="source ~/.bashrc"
alias batt="acpi"
alias temp="acpi -t"
alias BK="tmux rename-session BK"
# alias btcprice="echo $(curl -s https://btc-e.com/api/2/btc_usd/ticker | json_pp | grep last | cut -d : -f 2 | tr -d ,| tr -d ' ')"
alias c="clear"
alias checkkarma="bash ~/.scripts/checkkarma"
alias grepc="grep --color=always" 
alias listwifi="sudo iwlist wlan0 scan | sift -e ESSID -e Address -e Quality -e Encryption | head -32"
alias localip="ifconfig | grep -A3 wlp3s0 | grep \"inet \" | sed -e 's/^[[:space:]]*//' | cut -d \" \" -f2 | cut -d : -f2"
alias localipv6="ifconfig | grep -A3 wlp3s0 | grep inet6 | sed -e 's/^[[:space:]]*//' | cut -d \" \" -f3"
alias myip="curl -s https://v4.ifconfig.co"
alias myipv6="curl -s https://v6.ifconfig.co"
alias pingtest="ping -c 5 google.com"
alias pipes="pipes.sh -r 0 -p 10 -t 1"
alias steam="LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' /usr/bin/steam"

# Spread sheet calculator
alias sc="sc-im"

# mutt open gmail bh directly
alias muttg="mutt -F ~/.mutt/muttgrc"

# ls variations
alias la="ls -a"
alias ll="ls -l"
alias llg="ll | grep -i $1"
alias lag="ls -a | grep -i $1"
alias lsg="ls | grep -i $1"
alias lsc="ls --color=always"
alias lsag="ls -a | grep "
alias mygit="mygit | column -t"

# ncmpcpp
alias nvis="ncmpcpp -s visualizer"
alias nclk="ncmpcpp -s clock"
alias ncmpcpp="ncmpcpp -s playlist -S visualizer"

# Change mouse buttons
alias mouseright="xmodmap -e \"pointer = 3 2 1\""
alias mouseleft="xmodmap -e \"pointer = 1 2 3\"" 

# Move mouse out of the way
alias nomouse="xdotool mousemove 0 100"

# Log current ip address (both external and local, ipv4 only)
alias ipsave="/home/bk/.scripts/ipsave"

# Show last 10 used ipaddresses
alias tailip="tail ~/.ip.log"

# mpc
alias mpstat='mpc status; echo -n "Rated: "; echo "$(mpd-rate)/5"'
alias vol="mpc -q volume"
alias rate="mpd-rate $1"

# Enable float values. Keeps me sane
alias bc="bc -l"

# xkcd
alias cdx="cd /home/bk/xkcd_archive"

# Last xkcd comic
alias lastx="ls /home/bk/xkcd_archive/ | sort -n | tail -1"

# Welcome script
alias welcome="/home/bk/.scripts/welcome.sh"

# easier invocation
alias lines="wc -l" 

# Neat little script I found. Credits in file
alias remme="/home/bk/.scripts/remme"
alias suspend="/home/bk/.scripts/suspend"

# Prevent Oh $#!7 moments
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# List all alis
# Most of it is to make it look pretty. Show heading columns, numbers and colors
alias listall="echo -e '\e[31m\e[1mNo.\tAlias\t\tCommand\e[0m';grep alias ~/.bashrc |cut -d' ' -f2- | sed 's/\=/\t\t/g' | nl -w 2"

# Edit this file
alias edalias="vim ~/.bashrc"

# Edit git configs and shortcuts
alias edgit="vim ~/.gitconfig"
alias gstat="git status"

# Useful apt get shortcuts
alias autoremove="sudo equo autoremove"
alias cleanup="sudo equo cleanup"
alias install="sudo equo install $1"
alias remove="sudo equo remove $1"
alias search="equo search $1"
alias update="sudo equo update && sudo equo upgrade"

# List functions
alias listfun="cat ~/.bashrc | grep function | cut -c 9-  "

# some utilities
alias cc="xclip -selection clipboard /dev/null" #Clear clipboard
alias clip="xclip -selection clipboard"
alias scrot="scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png"

# lsrc is from rcm, a dotfile managing utility
alias lsrc="lsrc | sed 's/:/ -> /g'"

#weather
alias weather=". /home/bk/.scripts/ansiweather/ansiweather -F"

alias cal="task calendar"
alias outplaying="echo playing | toilet | lolcat ; echo ingress | toilet | lolcat ;"
alias headphones="pactl set-card-profile bluez_card.00_15_A1_05_65_52 a2dp_sink"
alias acpi="acpi -V"

# Endal

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

function mygit() {
	list="$(ls -1)";
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

# ack through the xkcd archive
function xkcg() {
	ack -ir $1 /home/bk/xkcd_archive/;
}

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
# . {repository_root}/powerline/bindings/bash/powerline.sh
. /usr/lib64/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export RTV_EDITOR="vim"
export EDITOR=/usr/bin/vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PATH="/home/bk/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/bk/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/bk/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/bk/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/bk/perl5"; export PERL_MM_OPT;


# pv wrapper that imitates cp usage
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage:
#   cpv file_or_dir_src file_or_dir_dst
#
# More details at ownyourbits.com

function cpv()
{
  local DST=${@: -1}                    # last element
  local SRC=( ${@: 1 : $# - 1} )        # array with rest of elements

  # checks
  type pv &>/dev/null || { echo "install pv first"; return 1; }
  [ $# -lt 2  ]       && { echo "too few args"    ; return 1; }

  # special invocation
  function cpv_rename()
  {
    local SRC="$1"
    local DST="$2"
    local DSTDIR="$( dirname $DST )"

    # checks
    if   [ $# -ne 2     ]; then echo "too few args"          ; return 1; fi
    if ! [ -e "$SRC"    ]; then echo "$SRC doesn't exist"    ; return 1; fi
    if   [ -d "$SRC"    ]; then echo "$SRC is a dir"         ; return 1; fi
    if ! [ -d "$DSTDIR" ]; then echo "$DSTDIR does not exist"; return 1; fi

    # actual copy
    echo -e "\n$SRC > $DST"
    pv   "$SRC" >"$DST"
  }

  # special case for cpv_rename()
  if ! [ -d "$DST" ]; then cpv_rename $@; return $?; fi;

  # more checks
  for src in ${SRC[@]}; do 
    local dst="$DST/$( basename $src )"
    if ! [ -e "$src" ]; then echo "$src doesn't exist" ; return 1;
    elif [ -e "$dst" ]; then echo "$dst already exists"; return 1; fi
  done

  # actual copy
  for src in ${SRC[@]}; do 
    if ! [ -d "$src" ]; then 
      local dst="$DST/$( basename $src )"
      echo -e "\n$src > $dst"
      pv "$src" > "$dst"
    else 
      local dir="$DST/$( basename $src )"
      mkdir "$dir" || continue
      local srcs=( $src/* )
      cpv ${srcs[@]} "$dir";
    fi
  done
  unset cpv_rename
}


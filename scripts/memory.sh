#!/bin/sh

#Thanks to github.com/xero and reddit.com/u/x_ero

#Born in this thread: https://www.reddit.com/r/unixporn/comments/4afp51/equivalent_of_ttyload_for_memory/
FULL=\=
EMPTY=.
INTERVAL=1

SIZE=$(tput cols)
SIZE=$((SIZE - 4))
#breakpoints in percent
percbreakpoint1=50
percbreakpoint2=80
percbreakpoint3=90
color1="[32m"
color2="[36m"
color3="[33m"
color4="[31m"
bgcolor="[30m"
nocolor="[0m"

draw() {
	perc=$1
	inc=$(( perc * SIZE / 100 ))
	breakpoint1=$(( percbreakpoint1 * SIZE / 100))
	breakpoint2=$(( percbreakpoint2 * SIZE / 100))
	breakpoint3=$(( percbreakpoint3 * SIZE / 100))
	out="$perc%"
	out="$out $color"
	for v in `seq 0 $(( SIZE - 1 ))`
	do
		if [ $v -le $breakpoint1 ]
		then
			color=$color1
		elif [ $v -gt $breakpoint1 ] && [ $v -le $breakpoint2 ]
		then
			color=$color2
		elif [ $v -gt $breakpoint2 ] && [ $v -le $breakpoint3 ]
		then
			color=$color3
		elif [ $v -gt $breakpoint3 ]
		then 
			color=$color4
		fi

		test "$v" -le "$inc"	 \
		&& out="${out}${color}${FULL}${nocolor}" \
		|| out="${out}${bgcolor}${EMPTY}${nocolor}"
	done
	echo $out
}

while :; do
	MEM=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
	draw $MEM
	sleep $INTERVAL
done

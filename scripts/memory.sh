#!/bin/sh

#Thanks to github.com/xero and reddit.com/u/x_ero

#Born in this thread: https://www.reddit.com/r/unixporn/comments/4afp51/equivalent_of_ttyload_for_memory/
FULL=\=
EMPTY=.
INTERVAL=10

SIZE=$(tput cols)
SIZE=$((SIZE - 4))
#breakpoints in percent
breakpoint1=50
breakpoint2=80
breakpoint3=90
color1="[32m"
color2="[36m"
color3="[33m"
color4="[31m"
bgcolor="[30m"
nocolor="[0m"

draw() {
	perc=$1
	inc=$(( perc * SIZE / 100 ))
	breakpoint1=$(( breakpoint1 * SIZE / 100))
	breakpoint2=$(( breakpoint2 * SIZE / 100))
	breakpoint3=$(( breakpoint3 * SIZE / 100))
	out="$perc%"
	out="$out $color"
	for v in `seq 0 $(( SIZE - 1 ))`
	do
		if (( v <= breakpoint1 ))
		then
			color=$color1
		elif (( v > breakpoint1 && v <= breakpoint2 ))
		then
			color=$color2
		elif (( v > breakpoint2 && v <= breakpoint3 ))
		then
			color=$color3
		elif (( v > breakpoint3 ))
		then 
			color=$color4
		fi

		test "$v" -le "$inc"	 \
		&& out="${out}${color}${FULL}${nocolor}" \
		|| out="${out}${bgcolor}${EMPTY}${nocolor}"
	done
	out="${out}${nocolor}"
	echo $out
}

while :; do
	MEM=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
	draw $MEM
	sleep $INTERVAL
done

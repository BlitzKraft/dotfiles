#!/bin/sh

#Thanks to github.com/xero and reddit.com/u/x_ero

#Born in this thread: https://www.reddit.com/r/unixporn/comments/4afp51/equivalent_of_ttyload_for_memory/
FULL=\=
#FULL=▓
#EMPTY=░
EMPTY=-
SIZE=80
INTERVAL=1

draw() {
	perc=$1
	inc=$(( perc * SIZE / 100 ))
	thiscolor=
	nocolor="[0m"
	case $inc in 
	[1-5]*)
		color="[1;32m"
		;;
	[6-8]*)
		color="[36m"
		;;
	9[*]) color="[1;31m"
		;;
	esac
	out="$perc% $color"
	for v in `seq 0 $(( SIZE - 1 ))`
	do
		test "$v" -le "$inc"	 \
		&& out="${out}${FULL}" \
		|| out="${out}${EMPTY}"
	done
	out="${out}${nocolor}"
	echo $out
}

while :; do
	MEM=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
	draw $MEM
	sleep $INTERVAL
done

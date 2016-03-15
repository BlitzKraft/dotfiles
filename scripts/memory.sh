#!/bin/sh

FULL=▓
EMPTY=░
SIZE=80
INTERVAL=1

draw() {
  perc=$1
  inc=$(( perc * SIZE / 100 ))
  out="$perc% "
  thiscolor=
  for v in `seq 0 $(( SIZE - 1 ))`
  do
    test "$v" -le "$inc"   \
    && out="${out}${FULL}" \
    || out="${out}${EMPTY}"
  done
  echo $out
}

while :; do
  MEM=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
  draw $MEM
  sleep $INTERVAL
done

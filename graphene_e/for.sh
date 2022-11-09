#!/bin/bash

echo > out.txt

start=${1:-0.5}
end=${2:-0.6}
loop=${3:-10}
echo -e "start\t\t= $start"
echo -e "end\t\t= $end"
echo -e "loop\t\t= $loop"

inc=0`echo "scale=20; ($end-$start)/$loop" | bc`
echo -e "increment\t= $inc"

cnt=$start
column=`sed -n '/ATOMIC_POSITIONS/=' graphene.scf.in`
replace="C 0.00 0.00 0.00\nC 0.00 0.00 0.00"

for i in `seq 1 $loop`
do
  cnt=`echo "scale=20; $cnt+$inc" | bc`

  replace="C 0.00 0.00 0.00\nC 0.00 $cnt 0.00"
  text=`sed "$((column+1)),$((column+2)) c $replace" graphene.scf.in | pw.x | grep -a "^\!" | sed -e "s/\![ \t]*total energy[ \t]*=[ \t]*\([-]*[0-9]\+[.]*[0-9]*\) Ry/\1/"`
  echo 0$cnt $text >> out.txt
done
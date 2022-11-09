#!/bin/bash

echo "" > out.txt
start=$1
end=$2
repeat=$3
cnt=$start
inc=`echo "scale=20; ($end-$start)/$repeat" | bc`
column=`sed -n '/ATOMIC_POSITIONS/=' graphene.scf.in`
replace="C 0.00 0.00 0.00\nC 0.00 0.00 0.00"
for i in `seq 1 ${repeat:=10}`
do
  cnt=`echo "scale=20; $cnt+$inc" | bc`
  replace="C 0.00 0.00 0.00\nC 0.00 $cnt 0.00"
  text=`echo sed "$((column+1)),$((column+2)) c $replace" graphene.scf.in | pw.x | grep -a "^\!" | sed -e "s/\![ \t]*total energy[ \t]*=[ \t]*\([-]*[0-9]\+[.]*[0-9]*\) Ry/\1/"`
  echo "$cnt $text" >> out.txt
done
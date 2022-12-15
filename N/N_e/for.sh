#!/bin/bash

echo > out.txt
file_name="N.scf.in"
start=${1:-0.2}
end=${2:-0.3}
loop=${3:-10}
echo -e "start\t\t= $start"
echo -e "end\t\t= $end"
echo -e "loop\t\t= $loop"

inc=0`echo "scale=20; ($end-$start)/$loop" | bc`
echo -e "increment\t= $inc"

cnt=$start
column=`sed -n '/ATOMIC_POSITIONS/=' $file_name`
replace="C 0.00 0.00 0.00\nC 0.00 0.00 0.00"

for i in `seq 1 $loop`
do

  echo -e "processing $cnt"

  cnt=`echo "scale=20; $cnt+$inc" | bc`

  replace="N 0.00 0.00 0.00\nN 0 $cnt 0"
  echo 0$cnt `sed "$((column+1)),$((column+2)) c $replace" $file_name | pw.x | grep -a "^\!" | sed -e "s/\![ \t]*total energy[ \t]*=[ \t]*\([-]*[0-9]\+[.]*[0-9]*\) Ry/\1/"` >> out.txt
done

echo -e "finish"

unset file_name
unset start
unset end
unset loop
unset inc
unset cnt
unset column
unset replace

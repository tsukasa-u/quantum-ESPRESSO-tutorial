#!/bin/bash

gnuplot << EOF
set terminal png
set output "charge.png"

set pm3d map
set size square
unset xtics
unset ytics
set cbtics 0.1
set cbrange [0:0.35]
set palette rgbformulae 33,13,10


splot 'charge.dat'


exit
EOF

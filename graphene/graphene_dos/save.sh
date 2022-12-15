#!/bin/bash

# gnuplot << EOF
# band.plt
# exit
# EOF

gnuplot << EOF
set terminal png
set output "dos.png"
set ylabel 'DOS (states/eV)'


plot 'graphene.dos' using 1:2 with lines

exit
EOF

gnuplot << EOF
set terminal png
set output "integrated_dos.png"
set ylabel 'integrated DOS'

plot 'graphene.dos' using 1:3 with lines

exit
EOF
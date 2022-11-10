#!/bin/bash
CMDNAME=`basename $0`

FLG_IN=
FLG_LINE=
FLG_OUT=
while getopts li:o: OPT
do
  case $OPT in
    "i" ) FLG_IN=1 ; IN_NAME="$OPTARG" ;;
    "l" ) FLG_LINE=1 ;;
    "o" ) FLG_OUT=1 ; OUT_NAME="$OPTARG" ;;
      * ) echo "Usage: $CMDNAME [-l] [-o INIPUT_FILE_NAME] [-o OUTPUT_FILE_NAME]" 1>&2
          exit 1 ;;
  esac
done


if [ -z "$FLG_IN" ]; then
    IN_NAME="out.txt"
fi

if [ -z "$FLG_OUT" ]; then
    OUT_NAME="out.png"
fi

OPTION=
if [ ! -z "$FLG_LINE" ]; then
    OPTION="with lines"
fi

gnuplot << EOF
set terminal png
set output "$OUT_NAME"
plot "$IN_NAME" $OPTION
exit
EOF

unset CMDNAME
unset FLG_IN
unset FLG_LINE
unset FLG_OUT
unset IN_NAME
unset OUT_NAME
unset OPTION

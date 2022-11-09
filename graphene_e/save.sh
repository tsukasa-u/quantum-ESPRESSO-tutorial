
CMDNAME=`basename $0`

while getopts li:o: OPT
do
  case $OPT in
    "i" ) FLG_IN=1 ; IN_NAME="$OPTARG" ;;
    "l" ) FLG_LINE=1 ;;
    "o" ) FLG_OUT=1 ; OUT_NAME="$OPTARG" ;;
      * ) echo "Usage: $CMDNAME [-l] [-o VALUE]" 1>&2
          exit 1 ;;
  esac
done


if [ -z "$FLG_IN" ]; then
    IN_NAME="out.txt"
fi

if [ -z "$FLG_OUT" ]; then
    OUT_NAME="out.png"
fi

if [ ! -z "$FLG_LINE" ]; then
    OPTION="with lines"
fi

gnuplot << EOF
set terminal png
set output "$IN_NAME"
plot $OUT_NAME OPTION
exit
EOF

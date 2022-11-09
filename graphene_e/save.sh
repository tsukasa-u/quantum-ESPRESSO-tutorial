
CMDNAME=`basename $0`

while getopts lo: OPT
do
  case $OPT in
    "l" ) FLG_LINE=1 ;;
    "o" ) FLG_TITLE=1 ; FILE_NAME="$OPTARG" ;;
      * ) echo "Usage: $CMDNAME [-l] [-o VALUE]" 1>&2
          exit 1 ;;
  esac
done

if [ ! -z "$FLG_LINE" ]; then
    
else then

fi
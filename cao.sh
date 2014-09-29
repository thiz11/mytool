for FILE in `grep CLEAR_VARS -r -A 1 mediatek/ | grep '\-include' | col1 \-`
do
STP1=`grep all-makefiles-under $FILE -n | col1 \:`
LINE=`expr "$STP1" - 1`
viim -c "$LINE s/^/# /g" -c "save $FILE" -c q $FILE
#echo $LINE
done


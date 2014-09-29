#rm list*
#for LST in `grep "#include " -r | cut -d \. -f -2 | NF \ | NF / | sed 's/\"//g' | sed 's/<//g' | sort | uniq`
#do
#find . -name $LST.h &>/dev/null
#if [ $? == "0" ]; then
#find . -name $LST.h >> list
#fi
#done

#for DFLT in `cat list | NF \/`
#do
#####egrep -r '\#include[ "<]{2}[/a-z\d__]{0,6}+/+$DFLT'  | NF "include " >> list2
#grep -r $DFLT | grep "#include " | NF "include " >> list2
#done

for LSL in `grep "/" lll | NF /`
do
find . -name $LSL -type f -print0 | xargs -0 rm
done

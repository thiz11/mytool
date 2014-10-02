#!/bin/bash
FWDIR=$1
SUFF=$2
FWORK=$3
VER=$4
tp=$(realpath $0)
bindir=$(dirname $tp)
rundir=`pwd`
stat $rundir/ff &>/dev/null
if [ $? != "0" ]; then
   type adb &>/dev/null
   if [ $? != "0" ]; then
	echo "Please put path/to/adb in your PATH"
   exit 1;
   else
	adb push $bindir/fixde /data/local/tmp/
	adb shell chmod 775 /data/local/tmp/fixde
	adb shell "/data/local/tmp/fixde > /data/local/tmp/ff"
	adb pull /data/local/tmp/ff $rundir
	stat $rundir/ff &>/dev/null
	if [ $? != "0" ]; then
	echo "I can't take the dex offset file"
	echo "Please check your device or adb. eg, Are you ROOT?"
	exit 1;
	fi
    fi
else
if [ $# == "3" ] || [ $# == "4" ]; then
	test -d $FWORK &>/dev/null
	if [ $? != "0" ]; then
	echo $FWORK": No such directory"
	echo "You must be specity framework directory"
	exit 1;
	else
	test -d $FWDIR &>/dev/null
	if [ $? != "0" ];then
	echo "Target directory dose no exist."
	exit 1;
	else
	if [ $SUFF == "apk" ] || [ $SUFF == "jar" ]; then
	cd $FWORK
	BCP=`ls -1 *.jar | awk '{printf ":"$0}'`
	BPK=`ls -1 *.apk | awk '{printf ":"$0}'`
	cd $FWDIR
	rm $rundir/faild.list &>/dev/null
	rm -rf $rundir/out &>/dev/null
    	for LST in `ls -1 *.odex | sed 's/\.odex//g'`
	do
	if [ $# == "3" ]; then
	VER="1.4.2"
	fi
	mkdir -p $rundir/out/$LST &>/dev/null
	cd $FWORK
	java -Xcheck:jni -Xbootclasspath/p$BCP -Xmx496M -ea:$BPK -cp $BCP -jar $bindir/baksmali_$VER.jar -d $FWORK -c $BCP -a 17 -T $rundir/ff -x $FWDIR/$LST.odex -o $rundir/out/$LST
	if [ $? == "0" ]; then
	cd $FWORK
	java -Xcheck:jni -Xbootclasspath/p$BCP -Xmx496M -ea:$BPK -cp $BCP -jar $bindir/smali_$VER.jar -a 17 -x $rundir/out/$LST -o $rundir/out/$LST/classes.dex
	cp $FWDIR/$LST.$SUFF $rundir/out/$LST/
	cd $rundir/out/$LST
	jar -uvf $LST.$SUFF classes.dex
	mkdir -p $rundir/dexdir &>/dev/null
	mv $rundir/out/$LST/$LST.$SUFF $rundir/dexdir/
	cd $FWDIR
	else
	echo $LST.$SUFF >> $rundir/faild.list
	FLD=$((count++))
	fi
	done
touch $rundir/faild.list
  if [ -z $FLD ]; then
  echo -e '\t\033[01;36m⚀\033[00m\033[02;40m☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢\033[00m\033[01;36m⚃\033[00m\n\t\033[01;36m⚁\033[00m\033[01;36m\t\t\tALL succeed!\033[00m\033[01;36m\t\t\t⚄\033[00m\n\t\033[01;36m⚂\033[00m\033[02;40m☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢☢\033[00m\033[01;36m⚅\033[00m\n'
  rm $rundir/faild.list &>/dev/null
  rm $rundir/ff &>/dev/null
  else
  echo -e '=================================='
  for EH in `cat $rundir/faild.list`
  do
  echo -e '\033[02;31m'$EH' \033[01;33mFaild!\033[00m'
  done
  echo -e '=================================='
  echo -e '\n\033[03;33m'FAILD file: $FLD'\033[00m\n'
  fi
 else
 echo "File format not recognized: Only supports apk and jar"
 exit 1;
 fi
 fi
fi
else
 echo -e "Usage:  autodex path/to/target suffix(apk or jar) path/to/framework's\n\tex:\n\tautodex ~/app apk ~/framework"
 exit 1;
fi
fi

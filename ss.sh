for SIZ in `grep partition_size mediatek/misc/MT6592_Android_scatter.txt | NF x`
do
SIZE=`echo $SIZ | xargs gbase -h | grep Dec | NF \ `
calc $SIZE/1024 >> size.pmt
done

#!/bin/sh
D1=`find bi -name "*.mk" | sed 's/^/\"/g' | sed 's/\.mk/\.mk\"\ /g' | awk '{printf $0}'`
D2=`find bionic -name "*.mk" | sed 's/^/\"/g'| sed 's/\.mk/\.mk\"\ /g' | awk '{printf $0}'`
for DP in `find bi -name "*.mk"`
do
DIR=$(dirname $DP)
mkdir mytool/$DIR -p
done

cat << EOF > tmp.tcl
#!/usr/bin/tclsh
foreach L { $D1 } R { $D2 }
{
exec sdiff \$L \$R -o mytool/\$L
}
EOF
chmod 775 tmp.tcl


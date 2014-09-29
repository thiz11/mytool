for LST in `find out/target/product/wiko/obj/ -name "*.h" -type f -not -path "*/KERNEL_OBJ/*" -not -path "*/GYP/*"`
do
FOLD=`echo $LST | awk -F"/" '{ print $(NF - 2)"/"$(NF - 1) }'`
mkdir -p mytool/headers/$FOLD
cp -R $LST mytool/headers/$FOLD/
done

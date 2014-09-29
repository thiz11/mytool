for LST in `grep chromium_org .repo/manifest.xml | cut -d \" -f 2-2`
do
repo sync $LST --local-only
done

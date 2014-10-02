for LST in `find .repo/projects -name config -type f`
do
LSUF=`grep -m 1 -w "url " $LST | \
awk -F"/" '{
if($2 == "default")
{ print "proj" }
if(NF < "3" && $2 != "default")
{system("echo "$0" | NF thiz11/")}
if(NF > "3" || NF == "3")
{system("echo "$0" | NF thiz11/ | tr / _")}
}'`
if [ "$LSUF" != "proj" ]; then
PROJ=$LSUF
else
PROJ=`grep -m 1 -w projectname $LST | NF " = "`
fi
PN=`grep -m 1 -w projectname $LST | NF " = "`
cat << EOF > $LST
[core]
	repositoryformatversion = 0
	filemode = true
[remote "aosp"]
	url = git@github.com:thiz11/$PROJ
	projectname = $PN
	fetch = +refs/heads/*:refs/remotes/aosp/*
[branch "master"]
	remote = aosp
	merge = refs/heads/master
EOF
done

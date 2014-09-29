for v in `cat si`
do
echo $v | \
awk -F"/" '{
 if($2 == "lib")
 {
   CLS = "SHARED_LIBRARIES"
   tpath = "\\$\\(TARGET_OUT\\)/"CLS
   SUFF = ".so"
 }

 if($2 == "vendor")
 {
   CLS = "VENDOR_SHARED_LIBRARIES"
   tpath = "\\$\\(TARGET_OUT\\)/"CLS
   SUFF = ".so"
 }

 if($2 == "app")
 {
   CLS = "APPS"
   tpath = "\\$\\(TARGET_OUT\\)/"CLS
   SUFF = ".apk"
 }

 if($2 == "framework")
  {
   CLS = "JAVA_LIBRARIES"
   tpath = "\\$\\(TARGET_OUT\\)/"CLS
   SUFF = ".jar"
  }

 if($2 == "etc")
 {
  CLS = "ETC"
  tpath = "\\$\\(TARGET_OUT\\)/"CLS
  SUFF = ""
 }

 if($2 == "bin")
 {
  CLS = "EXECUTABLES"
  tpath = "\\$\\(TARGET_OUT\\)/"CLS
  SUFF = ""
  }

 if($2 == "xbin")
 {
   CLS = "OPTIONAL_EXECUTABLES"
   tpath = "\\$\\(TARGET_OUT\\)/"CLS
   SUFF = ""
 }

 if($2 == "usr" && $3 == "keylayout")
 {
  CLS = "KEYLAYOUT"
  tpath = "\\$\\(TARGET_OUT\\)/"CLS
  SUFF = ".kl"
 }

 if($2 == "usr" && $3 == "keychars")
 {
  CLS = "KEYCHARS"
  tpath = "\\$\\(TARGET_OUT\\)/"CLS
  SUFF = ".kcm"
 }

 if($2 == "usr" && $3 == "icu")
 {
  CLS = ""
  tpath = "\\$\\(TARGET_OUT\\)/../system/usr/icu"
  SUFF = ".icu"
 }

 if($2 == "usr" && $3 == "idc")
 {
 CLS = ""
 tpath = "\\$\\(TARGET_OUT\\)/../system/usr/idc"
 SUFF = ".icu"
 }
}
{
system("echo LOCAL_MODULE_CLASS := " CLS " >> sss")
system("echo LOCAL_MODULE_PATH := " tpath " >> sss")
system("echo LOCAL_MODULE_SUFFIX := " SUFF " >> sss")
}'
done

DLST=`grep is_download mediatek/build/tools/ptgen/MT6592/MT6592_Android_scatter.txt | NF \ | gawk '{ if($1 == "true") { printf("\"Y\" "); }  else printf("\"N\" "); }'`
FLST=`grep file_name mediatek/build/tools/ptgen/MT6592/MT6592_Android_scatter.txt | NF \ | gawk '{ printf "\""$0"\" "}'`
FBDLS=`grep -A 1 FastBoot_Download ../emmc.yaml | grep eng | NF \ | gawk '{ printf "\""$0"\" "}'`
FBELS=`grep -A 1 FastBoot_E ../emmc.yaml | grep eng | NF \ | gawk '{ printf "\""$0"\" "}'`
TYLS=`grep operation_type mediatek/build/tools/ptgen/MT6592/MT6592_Android_scatter.txt | NF \ | gawk '{ printf "\""$0"\" "}'`
PNLS=`grep partition_name mediatek/build/tools/ptgen/MT6592/MT6592_Android_scatter.txt | NF \ | gawk '{ printf "\""$0"\" "}'`
REGLS=`grep region mediatek/build/tools/ptgen/MT6592/MT6592_Android_scatter.txt | NF \ | gawk '{ printf "\""$0"\" "}'`
RESLS=`grep reserved mediatek/build/tools/ptgen/MT6592/MT6592_Android_scatter.txt | NF \ | gawk '{ if($1 == "true") { printf("\"Y\" "); }  else printf("\"N\" "); }'`
SILS=`cat size.pmt | gawk '{ printf "\""$0"\" "}'`
TYPELS=`grep " type" mediatek/build/tools/ptgen/MT6592/MT6592_Android_scatter.txt | NF \ | gawk '{ if($1 == "NORMAL_ROM") { printf("\"Raw data\" "); } else if($1 == "EXT4_IMG") { printf("\"EXT4\" "); } else { printf "\""$0"\" "} }'`

echo "foreach D { $DLST } FILE { $FLST } FB_D_E { $FBDLS } FB_D_U { $FBDLS } FB_E_E { $FBELS } FB_E_U { $FBELS } TY { $TYLS } PN { $PNLS } REG { $REGLS } RES { $RESLS } SIE { $SILS } SIU { $SILS } FTYPE { $TYPELS } { exec ./emm.sh }" > t.tcl
chmod 775 t.tcl
tclsh t.tcl

foreach D { "Y" "Y" "Y" "N" "N" "N" "N" "N" "Y" "Y" "Y" "Y" "N" "Y" "Y" "N" "Y" "Y" "Y" "N" "N"  } FILE { "preloader.bin" "MBR" "EBR1" "NONE" "NONE" "NONE" "NONE" "NONE" "lk.bin" "boot.img" "recovery.img" "secro.img" "NONE" "logo.bin" "EBR2" "NONE" "system.img" "cache.img" "userdata.img" "NONE" "NONE"  } FB_D_E { "N" "Y" "N" "N" "N" "N" "N" "Y" "Y" "Y" "N" "N" "Y" "N" "N" "Y" "Y" "Y" "N" "N"  } FB_D_U { "N" "Y" "N" "N" "N" "N" "N" "Y" "Y" "Y" "N" "N" "Y" "N" "N" "Y" "Y" "Y" "N" "N"  } FB_E_E { "N" "Y" "N" "N" "N" "N" "N" "Y" "Y" "Y" "N" "N" "Y" "N" "N" "Y" "Y" "Y" "N" "N"  } FB_E_U { "N" "Y" "N" "N" "N" "N" "N" "Y" "Y" "Y" "N" "N" "Y" "N" "N" "Y" "Y" "Y" "N" "N"  } TY { "BOOTLOADERS" "UPDATE" "UPDATE" "PROTECTED" "BINREGION" "PROTECTED" "PROTECTED" "INVISIBLE" "UPDATE" "UPDATE" "UPDATE" "UPDATE" "INVISIBLE" "UPDATE" "UPDATE" "INVISIBLE" "UPDATE" "UPDATE" "UPDATE" "INVISIBLE" "RESERVED"  } PN { "PRELOADER" "MBR" "EBR1" "PRO_INFO" "NVRAM" "PROTECT_F" "PROTECT_S" "SECCFG" "UBOOT" "BOOTIMG" "RECOVERY" "SEC_RO" "MISC" "LOGO" "EBR2" "EXPDB" "ANDROID" "CACHE" "USRDATA" "FAT" "BMTPOOL"  } REG { "EMMC_BOOT_1" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER" "EMMC_USER"  } RES { "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "N" "Y"  } SIE { "256" "512" "512" "3072" "5120" "10240" "10240" "256" "384" "10240" "10240" "6144" "512" "8192" "512" "15744" "1851392" "131072" "10485760" "0" "21504"  } SIU { "256" "512" "512" "3072" "5120" "10240" "10240" "256" "384" "10240" "10240" "6144" "512" "8192" "512" "15744" "1851392" "131072" "10485760" "0" "21504"  } FTYPE { "SV5_BL_BIN" "Raw data" "Raw data" "Raw data" "Raw data" "EXT4" "EXT4" "Raw data" "Raw data" "Raw data" "Raw data" "EXT4" "Raw data" "Raw data" "Raw data" "Raw data" "EXT4" "EXT4" "EXT4" "FAT" "Raw data"  } {
exec echo "- Download: $D" >> e.yaml;
exec echo "Download_File: $FILE" >> e.yaml;
exec echo "FastBoot_Download:" >> e.yaml;
exec echo "  eng: $FB_D_E" >> e.yaml;
exec echo "  user: $FB_D_U" >> e.yaml;
exec echo "FastBoot_Erase:" >> e.yaml;
exec echo "  eng: $FB_E_E" >> e.yaml;
exec echo "  user: $FB_E_U" >> e.yaml;
exec echo "Operation_Type: $TY" >> e.yaml;
exec echo "Partition_Name: $PN" >> e.yaml;
exec echo "Region: $REG" >> e.yaml;
exec echo "Reserved: $RES" >> e.yaml;
exec echo "Size_KB:" >> e.yaml;
exec echo "  eng: $SIE" >> e.yaml;
exec echo "  user: $SIU" >> e.yaml;
exec echo "Type: $FTYPE" >> e.yaml;
}

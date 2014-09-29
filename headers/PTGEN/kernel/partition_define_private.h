#include "partition_define.h"
static const struct excel_info PartInfo_Private[PART_NUM]={
			{"preloader",262144,0x0, EMMC, 0,EMMC_PART_BOOT1},
			{"mbr",524288,0x0, EMMC, 0,EMMC_PART_USER},
			{"ebr1",524288,0x80000, EMMC, 1,EMMC_PART_USER},
			{"pro_info",3145728,0x100000, EMMC, 0,EMMC_PART_USER},
			{"nvram",5242880,0x400000, EMMC, 0,EMMC_PART_USER},
			{"protect_f",10485760,0x900000, EMMC, 2,EMMC_PART_USER},
			{"protect_s",10485760,0x1300000, EMMC, 3,EMMC_PART_USER},
			{"seccfg",262144,0x1d00000, EMMC, 0,EMMC_PART_USER},
			{"uboot",393216,0x1d40000, EMMC, 0,EMMC_PART_USER},
			{"bootimg",10485760,0x1da0000, EMMC, 0,EMMC_PART_USER},
			{"recovery",10485760,0x27a0000, EMMC, 0,EMMC_PART_USER},
			{"sec_ro",6291456,0x31a0000, EMMC, 4,EMMC_PART_USER},
			{"misc",524288,0x37a0000, EMMC, 0,EMMC_PART_USER},
			{"logo",8388608,0x3820000, EMMC, 0,EMMC_PART_USER},
			{"ebr2",524288,0x4020000, EMMC, 0,EMMC_PART_USER},
			{"expdb",16121856,0x40a0000, EMMC, 0,EMMC_PART_USER},
			{"android",1895825408,0x5000000, EMMC, 5,EMMC_PART_USER},
			{"cache",134217728,0x76000000, EMMC, 6,EMMC_PART_USER},
			{"usrdata",10737418240,0x7e000000, EMMC, 7,EMMC_PART_USER},
			{"fat",0,0x2fe000000, EMMC, 8,EMMC_PART_USER},
			{"bmtpool",22020096,0xFFFF00a8, EMMC, 0,EMMC_PART_USER},
 };

#ifdef  MTK_EMMC_SUPPORT
struct MBR_EBR_struct MBR_EBR_px[MBR_COUNT]={
	{"mbr", {1, 2, 3, 4, }},
	{"ebr1", {5, 6, 7, }},
	{"ebr2", {8, }},
};

EXPORT_SYMBOL(MBR_EBR_px);
#endif


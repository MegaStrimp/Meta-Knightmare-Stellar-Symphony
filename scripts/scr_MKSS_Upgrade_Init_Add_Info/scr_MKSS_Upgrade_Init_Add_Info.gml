///@description MKSS - Upgrade - Init - Add - Info

function scr_MKSS_Upgrade_Init_Add_Info(targetMappedID,targetTitle = undefined,targetPrice = undefined)
{
	global.MKSS_UpgradeList[targetMappedID].title = targetTitle;
	global.MKSS_UpgradeList[targetMappedID].price = targetPrice;
}
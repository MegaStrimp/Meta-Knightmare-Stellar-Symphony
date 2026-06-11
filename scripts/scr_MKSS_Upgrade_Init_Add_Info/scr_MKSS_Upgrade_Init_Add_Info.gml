///@description MKSS - Upgrade - Init - Add - Info

function scr_MKSS_Upgrade_Init_Add_Info(targetMappedID,targetTitle = undefined,targetDescription = [undefined],targetIcon = [undefined],targetPrice = 0)
{
	global.MKSS_UpgradeList[targetMappedID].title = targetTitle;
	global.MKSS_UpgradeList[targetMappedID].description = targetDescription;
	global.MKSS_UpgradeList[targetMappedID].icon = targetIcon;
	global.MKSS_UpgradeList[targetMappedID].price = targetPrice;
}
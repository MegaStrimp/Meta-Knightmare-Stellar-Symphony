///@description MKSS - Upgrade - Init - Add - Neighbors

function scr_MKSS_Upgrade_Init_Add_Neighbors(targetMappedID,targetNeighborLeft = undefined,targetNeighborRight = undefined,targetNeighborUp = undefined,targetNeighborDown = undefined)
{
	global.MKSS_UpgradeList[targetMappedID].neighborLeft = targetNeighborLeft;
	global.MKSS_UpgradeList[targetMappedID].neighborRight = targetNeighborRight;
	global.MKSS_UpgradeList[targetMappedID].neighborUp = targetNeighborUp;
	global.MKSS_UpgradeList[targetMappedID].neighborDown = targetNeighborDown;
}
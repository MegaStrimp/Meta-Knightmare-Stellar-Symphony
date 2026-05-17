///@description MKSS - Player - Check Upgrade

function scr_MKSS_Player_CheckUpgrade(playerNum,targetIDString)
{
	return (ds_list_find_value(global.MKSS_PlayerUpgradeList[playerNum],global.MKSS_UpgradeIDs[? targetIDString]) != undefined);
}
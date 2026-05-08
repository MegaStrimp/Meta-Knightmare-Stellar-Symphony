///@description MKSS - Player - Equip Spray

function scr_MKSS_Player_EquipSpray(targetSprayPaintID)
{
	global.playerSprayPaint[playerNum] = targetSprayPaintID;
	palSprite = global.MKSS_SprayPaintList[targetSprayPaintID].sprite;
}
///@description MKSS - Player - Init - Add - Sprite Set

function scr_MKSS_Player_Init_Add_SpriteSet(targetMappedID,targetSkin,targetSpriteSet)
{
	global.MKSS_PlayerList[targetMappedID].spriteSet[targetSkin] = targetSpriteSet;
}
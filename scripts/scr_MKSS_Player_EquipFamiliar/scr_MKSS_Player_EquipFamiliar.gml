///@description MKSS - Player - Equip Familiar

function scr_MKSS_Player_EquipFamiliar(targetFamiliarID)
{
	global.MKSS_PlayerFamiliar[playerNum] = targetFamiliarID;
	
	with (obj_MKSS_Familiar) if (followedObject == other) instance_destroy();
	
	if (targetFamiliarID != global.MKSS_FamiliarIDs[? "none"])
	{
		with (instance_create_depth(x,y,depth,obj_MKSS_Familiar))
		{
			followedObject = other;
			
			familiarIndex = targetFamiliarID;
			
			var targetSprite = global.MKSS_FamiliarList[familiarIndex].sprite;
			if (targetSprite != undefined) sprite_index = targetSprite;
			
			dirX = followedObject.dirX;
			image_xscale = scale * dirX;
			image_yscale = scale;
		}
	}
}
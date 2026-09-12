///@description MKSS - Weapon - Whiplash - Draw

function scr_MKSS_Weapon_Whiplash_Draw()
{
	#region Target
	if ((whiplash_MarkedObjectID != -1) and (instance_exists(whiplash_MarkedObjectID)))
	{
		#region Selection
		var scale = max(.5,((whiplash_MarkedObjectID.sprite_width + whiplash_MarkedObjectID.sprite_height) / 2) / 36) + targetScale;
		var targetX = whiplash_MarkedObjectID.x - whiplash_MarkedObjectID.sprite_xoffset + (whiplash_MarkedObjectID.sprite_width / 2);
		var targetY = whiplash_MarkedObjectID.y - whiplash_MarkedObjectID.sprite_yoffset + (whiplash_MarkedObjectID.sprite_height / 2);
		
		draw_sprite_ext(spr_MKSS_Weapon_Whiplash_Target,targetIndex,targetX,targetY,scale,scale,0,c_white,1);
		#endregion
	}
	#endregion
}
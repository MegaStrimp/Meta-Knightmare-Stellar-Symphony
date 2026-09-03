///@description Draw

#region Event Inherited
event_inherited();
#endregion

#region Big Star
draw_sprite(spr_MKSS_Particle_BigStar_Yellow,bigStarIndex,x + 8,y - 2);
#endregion

#region Text
scribble("[fnt_Advance_Small]" + text + "[/font]").wrap(48).align(fa_center,fa_bottom).draw(x + 8,y - 4);
#endregion

#region Button Hints
if (hasButtonHint)
{
	var playerIsNear = false;
	with (obj_Player)
	{
		if (distance_to_object(other) <= 6) playerIsNear = true;
	}
	
	if (playerIsNear)
	{
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("up"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,x + 2,y - sprite_height);
	}
}
#endregion
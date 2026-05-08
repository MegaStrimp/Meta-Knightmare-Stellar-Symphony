///@description Draw

#region Draw Self
if (isVisible) draw_self();
#endregion

#region Button Hints
if (playerIsNear)
{
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("up"))];
	if (targetIcon != undefined) draw_sprite(targetIcon,0,x - 6,y - 6 - sprite_height + (2 * (buttonInputTimerComponent_BTimer != -1)));
}
#endregion
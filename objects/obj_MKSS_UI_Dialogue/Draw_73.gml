///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Background
draw_set_alpha(.5);
draw_rectangle_color(xx,yy,xx + 240,yy + 48,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1);
#endregion

#region Portrait
if (currentPortrait != undefined)
{
	var finalImageIndex = 0;
	if (currentPortrait != portrait_Talk) finalImageIndex = portraitImageIndex;
	
	draw_sprite(currentPortrait,finalImageIndex,xx,yy);
}
#endregion

#region Text
if (text != undefined)
{
	scribble(text).wrap(180).draw(xx + 60,yy + 4,typist);
}
#endregion

#region Button Hints
if (!dialogueIsFlowing)
{
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
	if (targetIcon != undefined) draw_sprite(targetIcon,0,xx + 227,yy + 34 + (2 * (buttonInputTimerComponent_YTimer != -1)));
}
#endregion
///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);

var titleHeight = 0;
#endregion

#region Icon
if (icon != -1) draw_sprite(icon,0,xx + global.gameWidth + offset,yy);
#endregion

#region Title
if (title != -1)
{
	var titleText = scribble("[fnt_Advance]" + string(title) + "[/font]").align(fa_center).wrap(72);
	titleText.draw(xx + global.gameWidth - 36 + offset,yy + 45);
	
	titleHeight = titleText.get_height();
}
#endregion

#region To Go
if (toGo != -1) scribble("[fnt_Advance_Small]To Go: " + string(toGo) + "[/font]").align(fa_center).wrap(72).draw(xx + global.gameWidth - 36 + offset,yy + 45 + titleHeight + (2 * sign(titleHeight)));
#endregion

#region Next Text
scribble("[fnt_Advance]Next[/font]").draw(xx + global.gameWidth - 75 + offset,yy);
#endregion
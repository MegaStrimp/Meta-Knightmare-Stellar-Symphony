///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);

startX = xx;
startY = yy + 8 - (max(0,selection - 7) * separation);
#endregion

#region Selections
for (i = 0; i < ds_list_size(currentList); i++)
{
	#region Get Selection Index
	selectionIndex = ds_list_find_value(currentList,i);
	#endregion
	
	#region Draw Script
	if (global.settingsList[selectionIndex].drawScript == undefined)
	{
		var font = "[fnt_Advance_Gray]";
		if (selection == i) font = "[fnt_Advance]";
		
		scribble(font + global.settingsList[selectionIndex].title + "[/font]").draw(startX + 12,startY + (separation * i));
	}
	else
	{
		script_execute_ext(global.settingsList[selectionIndex].drawScript,global.settingsList[selectionIndex].drawScriptArgs);
	}
	#endregion
}

#region Button Hints
var exitIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
if (targetIcon != undefined) exitIcon = "[" + sprite_get_name(targetIcon) + "]";

var selectIcon1 = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
if (targetIcon != undefined) selectIcon1 = "[" + sprite_get_name(targetIcon) + "]";

var selectIcon2 = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("left"))];
if (targetIcon != undefined) selectIcon2 = "[" + sprite_get_name(targetIcon) + "]";

var selectIcon3 = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("right"))];
if (targetIcon != undefined) selectIcon3 = "[" + sprite_get_name(targetIcon) + "]";

scribble(exitIcon + "BACK").draw(xx + 1,yy + global.gameHeight - 16 + (2 * (buttonInputTimerComponent_BTimer != -1)));
var text = scribble(selectIcon1 + selectIcon2 + selectIcon3 + "SELECT");
text.draw(xx + global.gameWidth - 1 - text.get_width(),yy + global.gameHeight - 16 + (2 * ((buttonInputTimerComponent_ATimer != -1) or (buttonInputTimerComponent_LeftTimer != -1) or (buttonInputTimerComponent_RightTimer != -1))));

if (targetKey != "")
{
	draw_rectangle_color(xx,yy,xx + global.gameWidth,yy + global.gameHeight,c_black,c_black,c_black,c_black,false);
	
	scribble("PRESS THE KEY YOU WANT TO REBIND INTO").align(fa_center,fa_middle).wrap(global.gameWidth).draw(xx + global.gameWidth / 2,yy + global.gameHeight / 2);
}
#endregion
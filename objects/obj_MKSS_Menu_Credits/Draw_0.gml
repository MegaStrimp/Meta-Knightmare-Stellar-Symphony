///@description Draw

#region Draw Credits
var yy = 0;
var text = "";
var sep = 16;

for (var i = 0; i < array_length(creditsNames); i++)
{
	text = creditsNames[i];
	
	scribble("[fnt_Advance]" + string(text) + "[/font]").draw(8,yStart + yScroll + yy);
	yy += sep;
}
#endregion

#region Button Hints
var exitIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
if (targetIcon != undefined) exitIcon = "[" + sprite_get_name(targetIcon) + "]";

var selectIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
if (targetIcon != undefined) selectIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(exitIcon + "Exit").draw(4,room_height - 16 + (2 * (buttonInputTimerComponent_BTimer != -1)));
var text = scribble(selectIcon + "Speed Up");
text.draw(room_width - 4 - text.get_width(),room_height - 16 + (2 * (buttonInputTimerComponent_ATimer != -1)));
#endregion
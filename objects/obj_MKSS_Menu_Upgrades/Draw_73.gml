///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Lines
for (var i = 0; i < ds_list_size(constellationList); i++)
{
	var currentIndex = global.MKSS_UpgradeList[ds_list_find_value(constellationList,i)];
	
	if (currentIndex.neighborLeft != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborLeft];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborLeft);
		
		draw_line_color(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	}
	
	if (currentIndex.neighborRight != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborRight];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborRight);
		
		draw_line_color(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	}
	
	if (currentIndex.neighborUp != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborUp];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborUp);
		
		draw_line_color(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	}
	
	if (currentIndex.neighborDown != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[currentIndex.neighborDown];
		var neighborListIndex = ds_list_find_index(constellationList,currentIndex.neighborDown);
		
		draw_line_color(xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	}
}
#endregion

#region Nodes
for (var i = 0; i < ds_list_size(constellationList); i++)
{
	var currentIndex = global.MKSS_UpgradeList[ds_list_find_value(constellationList,i)];
	
	var targetSprite = obj_MKSS_Menu_Upgrades_Node;
	if (currentIndex.isLesserNode) targetSprite = obj_MKSS_Menu_Upgrades_LesserNode;
	
	draw_sprite(targetSprite,0,xx + currentIndex.x + constellationOffsets[i].x,yy + currentIndex.y + constellationOffsets[i].y);
}
#endregion

#region Page Title
var finalPageTitle = global.MKSS_UpgradeTypeList[global.MKSS_UpgradeList[ds_list_find_value(constellationList,selection)].categoryID].title;
if (finalPageTitle != undefined) scribble(finalPageTitle).align(fa_center).draw(xx + (global.gameWidth / 2),yy + 4);
#endregion

#region Upgrade Title
var finalTitle = global.MKSS_UpgradeList[ds_list_find_value(constellationList,selection)].title;
if (finalTitle != undefined) scribble(finalTitle).align(fa_center).draw(xx + (global.gameWidth / 2),yy + global.gameHeight - 26);
#endregion

#region Button Hints
var backIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
if (targetIcon != undefined) backIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(backIcon + " Back").draw(xx + 4,yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_BTimer != -1)));

var infoIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("X"))];
if (targetIcon != undefined) infoIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(infoIcon + " Info").align(fa_center).draw(xx + (global.gameWidth / 2),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_XTimer != -1)));

var buyIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
if (targetIcon != undefined) buyIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(buyIcon + " Buy");
text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_YTimer != -1)));

var prevIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("L"))];
if (targetIcon != undefined) prevIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(prevIcon + " Prev");
text.draw(xx + 4,yy + 14 - hintOffset + (2 * (buttonInputTimerComponent_LTimer != -1)));

var nextIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("R"))];
if (targetIcon != undefined) nextIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(nextIcon + " Next");
text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + 14 - hintOffset + (2 * (buttonInputTimerComponent_RTimer != -1)));
#endregion
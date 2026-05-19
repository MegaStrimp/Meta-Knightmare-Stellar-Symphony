///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);

var currentIndex = global.MKSS_UpgradeList[selection];
#endregion

#region Lines
for (var i = 0; i < ds_list_size(constellationList); i++)
{
	var iIndex = global.MKSS_UpgradeList[ds_list_find_value(constellationList,i)];
	
	if (iIndex.neighborLeft != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[iIndex.neighborLeft];
		var neighborListIndex = ds_list_find_index(constellationList,iIndex.neighborLeft);
		
		draw_line_color(xx + iIndex.x + constellationOffsets[i].x,yy + iIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	}
	
	//if (iIndex.neighborRight != undefined)
	//{
	//	var neighborIndex = global.MKSS_UpgradeList[iIndex.neighborRight];
	//	var neighborListIndex = ds_list_find_index(constellationList,iIndex.neighborRight);
		
	//	draw_line_color(xx + iIndex.x + constellationOffsets[i].x,yy + iIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	//}
	
	if (iIndex.neighborUp != undefined)
	{
		var neighborIndex = global.MKSS_UpgradeList[iIndex.neighborUp];
		var neighborListIndex = ds_list_find_index(constellationList,iIndex.neighborUp);
		
		draw_line_color(xx + iIndex.x + constellationOffsets[i].x,yy + iIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	}
	
	//if (iIndex.neighborDown != undefined)
	//{
	//	var neighborIndex = global.MKSS_UpgradeList[iIndex.neighborDown];
	//	var neighborListIndex = ds_list_find_index(constellationList,iIndex.neighborDown);
		
	//	draw_line_color(xx + iIndex.x + constellationOffsets[i].x,yy + iIndex.y + constellationOffsets[i].y,xx + neighborIndex.x + constellationOffsets[neighborListIndex].x,yy + neighborIndex.y + constellationOffsets[neighborListIndex].y,#4F4E7B,#4F4E7B);
	//}
}
#endregion

#region Nodes
for (var i = 0; i < ds_list_size(constellationList); i++)
{
	var iIndex = global.MKSS_UpgradeList[ds_list_find_value(constellationList,i)];
	
	var nodeX = xx + iIndex.x + constellationOffsets[i].x;
	var nodeY = yy + iIndex.y + constellationOffsets[i].y;
	var targetSprite = obj_MKSS_Menu_Upgrades_Node;
	if (iIndex.isLesserNode) targetSprite = obj_MKSS_Menu_Upgrades_LesserNode;
	
	draw_sprite(targetSprite,0,nodeX,nodeY);
	
	if (i == selection) draw_sprite_ext(spr_MKSS_UI_Shared_Selection,selectionIndex,nodeX,nodeY,selectionScale,selectionScale,0,c_white,1);
	
	if ((scr_MouseIsInbetween(nodeX - 6,nodeY - 6,nodeX + 6,nodeY + 6)) and (mouse_check_button(mb_left))) selection = ds_list_find_value(constellationList,i);
}
#endregion

#region Page Title
var finalPageTitle = global.MKSS_UpgradeTypeList[global.MKSS_UpgradeList[selection].categoryID].title;
if (finalPageTitle != undefined) scribble(finalPageTitle).align(fa_center).draw(xx + (global.gameWidth / 2),yy + 4);
#endregion

#region Upgrade Title
var finalTitle = global.MKSS_UpgradeList[selection].title;
if (finalTitle != undefined) scribble(finalTitle).align(fa_center).draw(xx + (global.gameWidth / 2),yy + global.gameHeight - 30 + constellationOffsets[0].y);
#endregion

#region Button Hints
var backIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
if (targetIcon != undefined) backIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(backIcon + " Back").draw(xx + 4,yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_BTimer != -1)));

if (!currentIndex.isLesserNode)
{
	var infoIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("X"))];
	if (targetIcon != undefined) infoIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	scribble(infoIcon + " Info").align(fa_center).draw(xx + (global.gameWidth / 2),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_XTimer != -1)));
	
	var buyIcon = "";
	var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
	if (targetIcon != undefined) buyIcon = "[" + sprite_get_name(targetIcon) + "]";
	
	var text = scribble(buyIcon + " Buy");
	text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_YTimer != -1)));
}

var prevIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("L"))];
if (targetIcon != undefined) prevIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(prevIcon + " Prev");
text.draw(xx + 4,yy + 2 - hintOffset + (2 * (buttonInputTimerComponent_LTimer != -1)));

var nextIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("R"))];
if (targetIcon != undefined) nextIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(nextIcon + " Next");
text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + 2 - hintOffset + (2 * (buttonInputTimerComponent_RTimer != -1)));
#endregion
	
#region Meta Points
draw_sprite_ext(spr_MKSS_Hud_MetaPoints_Icon,0,xx + 2,yy + 18,1,1,0,#FFFFFF,1);

var displayedPoints = string_replace_all(string_format(global.MKSS_PlayerMetaPoints[playerNum],4,0)," ","0");
scribble("[fnt_Advance_Small][d#FFFFFF]x[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(xx + 14,yy + 24);
#endregion
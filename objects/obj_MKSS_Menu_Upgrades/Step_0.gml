///@description Main

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);

var currentIndex = global.MKSS_UpgradeList[selection];
#endregion

#region Selection

#region Go Back
if ((input_check_pressed("B",playerNum)) or ((scr_MouseIsInbetween(xx + 4,yy + 144,xx + 50,yy + 156)) and (mouse_check_button_pressed(mb_left))))
{
	with (obj_FrameworkControl)
	{
		MKSS_GamePause_Locked = false;
		
		MKSS_GamePause_PauseButtonAlphaTarget = 1;
		
		MKSS_GamePause_CircleZoomTarget = 1;
	}
	
	scr_MKSS_Player_GetUnlockedUpgrades(0);
	
	instance_destroy();
}
#endregion

if (!currentIndex.isLesserNode)
{
	#region Info
	if ((input_check_pressed("X",playerNum)) or ((scr_MouseIsInbetween(xx + 97,yy + 144,xx + 143,yy + 156)) and (mouse_check_button_pressed(mb_left))))
	{
	}
	#endregion
	
	#region Buy
	if ((input_check_pressed("A",playerNum)) or ((scr_MouseIsInbetween(xx + 196,yy + 144,xx + 235,yy + 156)) and (mouse_check_button_pressed(mb_left))))
	{
	}
	#endregion
}

#region Go To Prev Page
if ((input_check_pressed("L",playerNum)) or ((scr_MouseIsInbetween(xx + 4,yy + 2,xx + 50,yy + 14)) and (mouse_check_button_pressed(mb_left))))
{
	constellationTypeList_CurrentIndex = (constellationTypeList_CurrentIndex - 1 + ds_list_size(constellationTypeList)) % ds_list_size(constellationTypeList);
	currentCategory = ds_list_find_value(constellationTypeList,constellationTypeList_CurrentIndex);
	
	scr_MKSS_Menu_Upgrades_SetUpgrades(currentCategory);
}
#endregion

#region Go To Next Page
if ((input_check_pressed("R",playerNum)) or ((scr_MouseIsInbetween(xx + 189,yy + 2,xx + 235,yy + 14)) and (mouse_check_button_pressed(mb_left))))
{
	constellationTypeList_CurrentIndex = (constellationTypeList_CurrentIndex + 1 + ds_list_size(constellationTypeList)) % ds_list_size(constellationTypeList);
	currentCategory = ds_list_find_value(constellationTypeList,constellationTypeList_CurrentIndex);
	
	scr_MKSS_Menu_Upgrades_SetUpgrades(currentCategory);
}
#endregion

#region Move To Up Neighbor
if (input_check_pressed("up",playerNum))
{
	if (currentIndex.neighborUp != undefined) selection = currentIndex.neighborUp;
}
#endregion

#region Move To Down Neighbor
if (input_check_pressed("down",playerNum))
{
	if (currentIndex.neighborDown != undefined) selection = currentIndex.neighborDown;
}
#endregion

#region Move To Left Neighbor
if (input_check_pressed("left",playerNum))
{
	if (currentIndex.neighborLeft != undefined) selection = currentIndex.neighborLeft;
}
#endregion

#region Move To Right Neighbor
if (input_check_pressed("right",playerNum))
{
	if (currentIndex.neighborRight != undefined) selection = currentIndex.neighborRight;
}
#endregion
#endregion

#region Selection Animation
selectionIndex = (selectionIndex + selectionSpd) % selectionNumber;
selectionScale = .5 + sine_wave(current_time / 6000,.2,.05,0);
#endregion

#region Movement
for (var i = 0; i < ds_list_size(constellationList); i++)
{
	constellationOffsets[i].x = sine_wave(current_time / constellationOffsets[i].wave,1,1.5,0);
	constellationOffsets[i].y = sine_wave(current_time / (constellationOffsets[i].wave + 500),.7,2.5,0);
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
///@description Main

#region Variables
var canSelect = true;
if ((global.pauseFinal) or
(instance_exists(obj_Transition))) canSelect = false;

startX = 0;
startY = 8 - (max(0,selection - 7) * separation);
#endregion

#region Selection
if (canSelect)
{
	#region Navigation
	if (input_check_pressed("up",playerNum))
	{
		//scr_PlaySfx(snd_KSW_BossHealth);
		
		selection = (selection - 1 + ds_list_size(currentList)) % ds_list_size(currentList);
	}
	
	if (input_check_pressed("down",playerNum))
	{
		//scr_PlaySfx(snd_KSW_BossHealth);
		
		selection = (selection + 1 + ds_list_size(currentList)) % ds_list_size(currentList);
	}
	#endregion
	
	#region Mouse Pressed
	for (var i = 0; i <= ds_list_size(currentList); i++)
	{
		if ((!mousePressed) and (scr_MouseIsInbetween(startX + 8,startY + (separation * i),startX + 8 + 120,startY + (separation * i) + 12)) and (mouse_check_button_pressed(mb_left)))
		{
			mousePressed = true;
			
			if (selection == i)
			{
				settingPressed = true;
			}
			else
			{
				//scr_PlaySfx(snd_KSW_BossHealth);
				
				selection = i;
			}
		}
	}
	
	if ((scr_MouseIsInbetween(182,144,235,156)) and (mouse_check_button_pressed(mb_left))) settingPressed = true;
	#endregion
	
	#region Get Selection Index
	var selectionIndex = ds_list_find_value(currentList,selection);
	#endregion
	
	#region Select Action
	if ((settingPressed) or (input_check_pressed("A",playerNum)) or (input_check_pressed("start",playerNum)))
	{
		if (global.settingsList[selectionIndex].selectAction != undefined) script_execute_ext(global.settingsList[selectionIndex].selectAction,global.settingsList[selectionIndex].selectActionArgs);
	}
	#endregion
	
	#region Back Action
	if ((targetKey == "") and ((input_check_pressed("B",playerNum)) or (keyboard_check_pressed(vk_escape))) or ((scr_MouseIsInbetween(4,144,43,156)) and (mouse_check_button_pressed(mb_left))))
	{
		if (global.settingsList[selectionIndex].backAction != undefined) script_execute_ext(global.settingsList[selectionIndex].backAction,global.settingsList[selectionIndex].backActionArgs);
	}
	#endregion
	
	#region Up Action
	if (input_check_pressed("up",playerNum))
	{
		if (global.settingsList[selectionIndex].upAction != undefined) script_execute_ext(global.settingsList[selectionIndex].upAction,global.settingsList[selectionIndex].upActionArgs);
	}
	#endregion
	
	#region Down Action
	if (input_check_pressed("down",playerNum))
	{
		if (global.settingsList[selectionIndex].downAction != undefined) script_execute_ext(global.settingsList[selectionIndex].downAction,global.settingsList[selectionIndex].downActionArgs);
	}
	#endregion
	
	#region Left Action
	if (input_check_pressed("left",playerNum))
	{
		if (global.settingsList[selectionIndex].leftAction != undefined) script_execute_ext(global.settingsList[selectionIndex].leftAction,global.settingsList[selectionIndex].leftActionArgs);
	}
	#endregion
	
	#region Right Action
	if (input_check_pressed("right",playerNum))
	{
		if (global.settingsList[selectionIndex].rightAction != undefined) script_execute_ext(global.settingsList[selectionIndex].rightAction,global.settingsList[selectionIndex].rightActionArgs);
	}
	#endregion
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
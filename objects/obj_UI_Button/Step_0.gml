///@description Main

if (!localPause)
{
	#region Variables
	var mouseOnTop = position_meeting(mouse_x,mouse_y,id);
	#endregion
	
	#region Base
	if ((!maskBaseScript) and (baseScript != undefined)) script_execute(baseScript);
	#endregion
	
	if (isSelected)
	{
		#region Trigger
		if ((!maskTriggerScript) and (triggerScript != undefined))
		{
			if ((input_check_pressed("A",playerNum)) or (input_check_pressed("start",playerNum)) or ((mouseOnTop) and (mouse_check_button_pressed(mb_left))))
			{
				script_execute(triggerScript);
			}
		}
		#endregion
		
		#region Neighbors
		if ((!maskNeighborLeft) and (neighborLeft != undefined))
		{
			if (input_check_pressed("left",playerNum)) targetNeighbor = neighborLeft;
		}
		
		if ((!maskNeighborRight) and (neighborRight != undefined))
		{
			if (input_check_pressed("right",playerNum)) targetNeighbor = neighborRight;
		}
		
		if ((!maskNeighborUp) and (neighborUp != undefined))
		{
			if (input_check_pressed("up",playerNum)) targetNeighbor = neighborUp;
		}
		
		if ((!maskNeighborDown) and (neighborDown != undefined))
		{
			if (input_check_pressed("down",playerNum)) targetNeighbor = neighborDown;
		}
		#endregion
	}
	else
	{
		if ((mouseOnTop) and (mouse_check_button_pressed(mb_left))) scr_UI_Button_Select(ID);
	}
}
///@description Main

if (isActive)
{
	#region Selection
	if (input_check_pressed("A",playerNum))
	{
		scr_PlaySfx(snd_MKSS_DoorEnter);
		
		if (targetRoom != -1) scr_GoToRoom(targetRoom,false);
	}
	
	if (input_check_pressed("B",playerNum))
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		global.hasHud = true;
		
		with (ownerPedestal) isActive = false;
		with (obj_Player)
		{
			if (playerNum == other.playerNum)
			{
				isPaused = false;
			}
		}
		
		isActive = false;
	}
	#endregion
}

if (!localPause)
{
	#region Player Camera Y Offset
	with (obj_Player)
	{
		if (playerNum == 0)
		{
			cameraYOffset = lerp(cameraYOffset,-36 * other.isActive,.05);
		}
	}
	#endregion
	
	#region Circle Radius
	circleRadius = lerp(circleRadius,4 + (70 * isActive),.05);
	#endregion
}

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
///@description Main

#region Step Script
if (stepScript != -1) script_execute(stepScript);
#endregion

if (!localPause)
{
	#region Pause
	if ((input_check_pressed("start",playerNum)) and (canBePaused))
	{
		scr_Debug_WriteLog("Cutscene Phase - " + string(phase));
		scr_Debug_WriteLog("Cutscene Timer - " + string(phaseTimer));
		
		global.MKSS_CutsceneIsPaused = true;
	}
	#endregion
	
	#region Phase Timer
	if (phaseTimer != -1)
	{
		phaseTimer = max(phaseTimer - speedMultFinal,0);
		if (phaseTimer == 0)
		{
			if (phaseSetupScript[phase] != -1) script_execute(phaseSetupScript[phase]);
			
			phase += 1;
			
			if (phase == array_length(phaseSetupScript)) phaseTimer = -1;
		}
	}
	#endregion
}
else
{
	#region Resume
	if (input_check_pressed("start",playerNum))
	{
		global.MKSS_CutsceneIsPaused = false;
	}
	#endregion
	
	#region Skip
	if (input_check_pressed("select",playerNum))
	{
		global.MKSS_CutsceneIsPaused = false;
		
		if (phaseSetupScript[array_length(phaseSetupScript) - 1] != -1) script_execute(phaseSetupScript[array_length(phaseSetupScript) - 1]);
	}
	#endregion
}
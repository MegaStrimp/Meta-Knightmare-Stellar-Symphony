///@description MKSS - Pause - Execute

function scr_MKSS_Pause_Execute()
{
	if ((!global.pause) and (global.canGamePause) and (gamePauseDelayTimer == -1) and (input_check_pressed("start",playerNum)) and (!instance_exists(obj_Transition)))
	{
		scr_PlaySfx(snd_MKSS_Pause);
		
		global.gamePause = true;
		global.hasHud = false;
		
		MKSS_GamePause_Locked = false;
		
		MKSS_GamePause_TitleXTarget = 2;
		
		MKSS_GamePause_DecalLengthTarget = 0;
		MKSS_GamePause_Upgrades_ButtonYTarget = 28;
		MKSS_GamePause_SettingsButtonYTarget = 85;
		MKSS_GamePause_ExitButtonYTarget = 90;
		MKSS_GamePause_ReturnButtonYTarget = 135;
		
		MKSS_GamePause_DecalStarTimer = MKSS_GamePause_DecalStarTimerMax;
		
		gamePauseDelayTimer = gamePauseDelayTimerMax;
		
		gamePauseDelayTimer = gamePauseDelayTimerMax;
	}
}
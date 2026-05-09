///@description MKSS - Pause Script

function scr_MKSS_PauseScript()
{
	var healPause = false;
	
	with (obj_MKSS_Control)
	{
		for (var i = 0; i < global.maxPlayers; i++)
		{
			if (healPauseTimer[i] != -1) healPause = true;
		}
	}
	
	var pause = ((healPause) or (global.MKSS_StageIntroPlaying) or (global.MKSS_CutsceneIsPaused) or (instance_exists(obj_MKSS_UI_StageClear)));
	
	return pause;
}
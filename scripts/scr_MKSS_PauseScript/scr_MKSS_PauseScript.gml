///@description MKSS - Pause Script

function scr_MKSS_PauseScript()
{
	var pause = ((global.MKSS_StageIntroPlaying) or (global.MKSS_CutsceneIsPaused) or (instance_exists(obj_MKSS_UI_StageClear)));
	
	return pause;
}
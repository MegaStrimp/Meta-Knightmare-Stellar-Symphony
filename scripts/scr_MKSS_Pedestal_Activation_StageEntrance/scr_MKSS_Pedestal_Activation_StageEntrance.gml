///@description MKSS - Switch - Pedestal - Stage Entrance

function scr_MKSS_Pedestal_Activation_StageEntrance()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.hasHud = false;
	
	isActive = true;
	with (instance_nearest(x,y,obj_MKSS_StageEntrance))
	{
		isActive = true;
	}
	with (targetPlayer) isPaused = true;
}
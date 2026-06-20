///@description MKSS - Switch - Pedestal - Familiar Changer

function scr_MKSS_Pedestal_Activation_FamiliarChanger()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.hasHud = false;
	
	isActive = true;
	with (instance_nearest(x,y,obj_MKSS_FamiliarChanger))
	{
		scr_MKSS_FamiliarChanger_SetFamiliarList();
		
		isActive = true;
	}
	with (targetPlayer)
	{
		isRunning = false;
		runBuffer = -1;
		runTurnBuffer = -1;
		runParticleTimer = -1;
		fallDuckTimer = -1;
		walkSquishTimer = -1;
		fallHopTimer = -1;
		canFallHop = false;
		fallHopJumped = false;
		
		isPaused = true;
	}
}
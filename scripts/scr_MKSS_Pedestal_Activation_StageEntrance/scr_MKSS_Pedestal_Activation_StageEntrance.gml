///@description MKSS - Switch - Pedestal - Stage Entrance

function scr_MKSS_Pedestal_Activation_StageEntrance()
{
	var sfx = scr_PlaySfx(snd_MKSS_ButtonChange);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	global.hasHud = false;
	
	isActive = true;
	with (instance_nearest(x,y,obj_MKSS_StageEntrance))
	{
		particleTimer = 0;
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
		
		hasAttackAnimation = true;
		scr_ChangeSprite(spriteSet.sprFront,true);
		isPaused = true;
	}
}
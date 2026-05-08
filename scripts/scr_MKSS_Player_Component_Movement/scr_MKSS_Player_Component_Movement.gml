///@description MKSS - Player - Component - Movement

function scr_MKSS_Player_Component_Movement()
{
	#region Variables
	var bothMovementKeysHeld = ((input_check("right",playerNum)) and (input_check("left",playerNum)));
	#endregion
	
	#region Walk
	var canWalk = true;
	if (
	(hurtState == hurtStates.hurt) or
	(walkSquishTimer != -1) or
	(attackStopMovement) or
	(global.MKSS_CutsceneStopMovement)
	) canWalk = false;
	
	isWalking = false;
	
	if (canWalk)
	{
		isWalking = ((isRunning) or (((input_check("right",playerNum)) or (input_check("left",playerNum))) and (!bothMovementKeysHeld)));
		
		#region Accelerate
		var canAccel = true;
		if (attackStopMovement) canAccel = false;
		
		if (canAccel)
		{
			var accelFinal = accel * ((isRunning * (movespeedRun / movespeedNormal)) + 1) * speedMultFinal;
			
			if (input_check("right",playerNum))
			{
				var targetDirX = 1;
				var runTurnActivate = ((runTurnBuffer == -1) and (dirX != targetDirX)) or ((runTurnBuffer != -1) and (runTurnDirX != targetDirX));
				
				if (runTurnBuffer == -1)
				{
					hsp += accelFinal;
					dirX = targetDirX;
				}
			}
			
			if (input_check_pressed("right",playerNum))
			{
				if ((canRunTurn) and (grounded) and (isRunning) and (runTurnActivate))
				{
					scr_PlaySfx(snd_MKSS_RunBegin);
					
					runParticleNum = 0;
					runParticleTimer = 0;
					dirX = targetDirX;
					runTurnBuffer = runTurnBufferMax;
					runTurnDirX = targetDirX;
					hsp = max(1 * speedMultFinal,abs(hsp)) * -runTurnDirX;
				}
			}
			
			if (input_check("left",playerNum))
			{
				var targetDirX = -1;
				var runTurnActivate = ((runTurnBuffer == -1) and (dirX != targetDirX)) or ((runTurnBuffer != -1) and (runTurnDirX != targetDirX));
				
				if (runTurnBuffer == -1)
				{
					hsp -= accelFinal;
					dirX = targetDirX;
				}
			}
			
			if (input_check_pressed("left",playerNum))
			{
				if ((canRunTurn) and (grounded) and (isRunning) and (runTurnActivate))
				{
					scr_PlaySfx(snd_MKSS_RunBegin);
					
					runParticleNum = 0;
					runParticleTimer = 0;
					dirX = targetDirX;
					runTurnBuffer = runTurnBufferMax;
					runTurnDirX = targetDirX;
					hsp = max(1 * speedMultFinal,abs(hsp)) * -runTurnDirX;
				}
			}
		}
		#endregion
	}
	#endregion
	
	#region Decelerate
	if ((!canWalk) or (runTurnBuffer != -1) or (bothMovementKeysHeld) or ((!input_check("right",playerNum)) and (!input_check("left",playerNum))))
	{
		var decelFinal = decel * (isRunning + 1) * ((runTurnBuffer != -1) + 1) * speedMultFinal;
		
		hsp = scr_Entity_Friction(hsp,decelFinal);
	}
	#endregion
	
	#region Speed Limit
	var hasSpeedLimit = true;
	if ((hurtState == hurtStates.hurt)
	or (attackStopSpeedLimit)) hasSpeedLimit = false;
	
	if (hasSpeedLimit)
	{
		var maxMovespeed = movespeed * speedMultFinal;
		hsp = clamp(hsp,-maxMovespeed,maxMovespeed);
	}
	#endregion
}
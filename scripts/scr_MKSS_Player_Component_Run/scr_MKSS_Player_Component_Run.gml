///@description MKSS - Player - Component - Run

function scr_MKSS_Player_Component_Run()
{
	#region Run
	var canRun = true;
	if (global.MKSS_CutsceneStopMovement) canRun = false;
	
	canRunTurn = true;
	
	if (canRun)
	{
		if (isRunning)
		{
			movespeed = movespeedRun;
		}
		else
		{
			if (isFlying)
			{
				movespeed = movespeedRun;
			}
			else
			{
				movespeed = movespeedNormal;
			}
			
			if ((runTurnBuffer == -1) and ((input_check_pressed("right",playerNum)) or (input_check_pressed("left",playerNum))))
			{
				if (runBuffer != -1)
				{
					scr_PlaySfx(snd_MKSS_RunBegin);
					
					isRunning = true;
					runParticleNum = 0;
					runParticleTimer = 0;
					movespeed = movespeedRun;
					
					if (!grounded)
					{
						var angle = 90 + (20 * dirX);
						scr_MKSS_ParticleSet_Jump(x,y,angle);
					}
				}
				
				runBuffer = runBufferMax;
			}
		}
	}
	else
	{
		isRunning = false;
		runBuffer = -1;
	}
	
	#region Run Buffer
	if ((runBuffer != -1) and (runTurnBuffer == -1) and ((!input_check("right",playerNum)) and (!input_check("left",playerNum))))
	{
		runBuffer = max(runBuffer - speedMultFinal,0);
		if (runBuffer == 0)
		{
			isRunning = false;
			runBuffer = -1;
		}
	}
	#endregion
	
	#region Run Turn Buffer
	if (runTurnBuffer != -1)
	{
		runTurnBuffer = max(runTurnBuffer - speedMultFinal,0);
		if (runTurnBuffer == 0)
		{
			hsp = abs(hsp) * runTurnDirX;
			runTurnBuffer = -1;
		}
	}
	#endregion
	
	#region Run Particle Timer
	if (runParticleTimer != -1)
	{
		runParticleTimer = max(runParticleTimer - speedMultFinal,0);
		if (runParticleTimer == 0)
		{
			if (isRunning)
			{
				if ((grounded) and (abs(hsp) >= (movespeedRun * .25)))
				{
					scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
				}
				if (runParticleNum == 0)
				{
					runParticleTimer = runParticleTimerMin;
					runParticleNum += 1;
				}
				else
				{
					runParticleNum = 0;
					runParticleTimer = runParticleTimerMax;
				}
			}
			else
			{
				runParticleNum = 0;
				runParticleTimer = -1;
			}
		}
	}
	#endregion
	#endregion
}
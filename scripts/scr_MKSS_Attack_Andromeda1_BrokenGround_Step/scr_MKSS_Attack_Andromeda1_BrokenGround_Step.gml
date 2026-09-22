///@description MKSS - Attack - Andromeda 1 - Broken Ground - Step

function scr_MKSS_Attack_Andromeda1_BrokenGround_Step()
{
	if (!localPause)
	{
		#region Damage Delay
		if (dmgStartTimer != -1)
		{
			dmgStartTimer = max(dmgStartTimer - speedMultFinal,0);
			if (dmgStartTimer == 0)
			{
				dmg = targetDmg;
				
				dmgStartTimer = -1;
			}
		}
		#endregion
		
		#region Particles
		if (stopTimer != -1)
		{
			if (particleTimer != -1)
			{
				particleTimer = max(particleTimer - speedMultFinal,0);
				if (particleTimer == 0)
				{
					repeat(irandom_range(2,5))
					{
						scr_MKSS_ParticleSet_TinySpark(x + irandom_range(-32,32),y + irandom_range(0,24));
					}
				
					particleTimer = particleTimerMax;
				}
			}
		
			if (sparkTimer != -1)
			{
				sparkTimer = max(sparkTimer - speedMultFinal,0);
				if (sparkTimer == 0)
				{
					scr_MKSS_ParticleSet_Spark(x - choose(-24,24),y + irandom_range(4,8),6, -3);
				
					sparkTimer = sparkTimerMax;
				}
			}
		}
		#endregion
		
		#region Stop
		if (stopTimer != -1)
		{
			stopTimer = max(stopTimer - speedMultFinal,0);
			if (stopTimer == 0)
			{
				dmg = -1;
				
				stopTimer = -1;
			}
		}
		#endregion
	}
}
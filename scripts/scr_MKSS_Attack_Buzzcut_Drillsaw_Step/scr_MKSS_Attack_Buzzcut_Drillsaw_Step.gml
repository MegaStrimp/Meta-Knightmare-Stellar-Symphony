///@description MKSS - Attack - Buzzcut - Drillsaw - Step

function scr_MKSS_Attack_Buzzcut_Drillsaw_Step()
{
	if (!localPause)
	{
		#region Movement
		hsp = movespeed * dirX * speedMultFinal;
		#endregion
		
		#region Gravity
		scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal)
		#endregion
		
		#region Particle Timer
		if (particleTimer != -1)
		{
			particleTimer = max(particleTimer - speedMultFinal,0);
			if (particleTimer == 0)
			{
				//scr_MKSS_ParticleSet_Run(x + (8 * -dirX),y + 8,dirX); STRIMPTODO Add Sparks
				
				particleTimer = particleTimerMax;
			}
		}
		#endregion
		
		#region Collision
		scr_Entity_Collision();
		#endregion
	}
}
///@description MKSS - Attack - Starless Marx - Marx Cannon - Step

function scr_MKSS_Attack_StarlessMarx_MarxCannon_Step()
{
	if (!localPause)
	{
		#region Particles
		if (particleTimer != -1)
		{
			particleTimer = max(particleTimer-speedMultFinal,0);
			if (particleTimer == 0)
			{
				scr_MKSS_ParticleSet_MarxCannon(owner.x+(24*owner.dirX),owner.y+irandom_range(-(laserHeight/2),laserHeight/2),12*owner.dirX);
				
				particleTimer = particleTimerMax;
			}
		}
		#endregion
		
		#region Laser
		laserWidth = min(laserWidth+(laserWidthGain*speedMultFinal),laserWidthMax);
		laserHeight = min(laserHeight+(laserHeightGain*speedMultFinal),laserHeightMax);
		
		laserHeightOffsetTimer = max(laserHeightOffsetTimer-speedMultFinal,0);
		if (laserHeightOffsetTimer == 0)
		{
			laserHeightOffset = !laserHeightOffset;
			
			laserHeightOffsetTimer = laserHeightOffsetTimerMax;
		}
		#endregion
	}
}
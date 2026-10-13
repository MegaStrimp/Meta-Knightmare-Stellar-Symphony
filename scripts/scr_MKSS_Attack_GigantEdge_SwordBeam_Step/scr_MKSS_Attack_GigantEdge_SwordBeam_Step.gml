///@description MKSS - Attack - Gigant Edge - Sword Beam - Step

function scr_MKSS_Attack_GigantEdge_SwordBeam_Step()
{
	if (!localPause)
	{
		#region Particles
		if (particleTimer != -1)
		{
			particleTimer = max(particleTimer-speedMultFinal,0);
			if (particleTimer == 0)
			{
				scr_MKSS_ParticleSet_BlueSparkle(x+irandom_range(-12,12),y+irandom_range(-6,6),random_range(.25,1)*-sign(hsp),random_range(-.75,0));
				
				particleTimer = particleTimerMax;
			}
			
			trailTimer = max(trailTimer-speedMultFinal,0);
			if (trailTimer == 0)
			{
				scr_MKSS_ParticleSet_Afterimage(x,y,,,,,,-1,0);
				
				trailTimer = trailTimerMax;
			}
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}
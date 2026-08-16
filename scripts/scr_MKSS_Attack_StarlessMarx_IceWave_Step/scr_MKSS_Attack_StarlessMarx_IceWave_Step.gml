///@description MKSS - Attack - Starless Marx - Ice Wave - Step

function scr_MKSS_Attack_StarlessMarx_IceWave_Step()
{
	if (!localPause)
	{
		#region Particles
		particleTimer = max(particleTimer - speedMultFinal,0);
		if (particleTimer == 0)
		{
			scr_MKSS_ParticleSet_Common(x+irandom_range(-5,5),y+irandom_range(-5,5),spr_MKSS_Particle_CrossStar3,-1);
			
			particleTimer = particleTimerMax;
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}
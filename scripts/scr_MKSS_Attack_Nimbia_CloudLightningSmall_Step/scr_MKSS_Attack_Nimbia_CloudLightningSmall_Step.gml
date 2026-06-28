///@description MKSS - Attack - Nimbia - Cloud Lightning Small - Step

function scr_MKSS_Attack_Nimbia_CloudLightningSmall_Step()
{
	if (!localPause)
	{
		#region Lightning
		lightningTimer = max(lightningTimer-speedMultFinal,0);
		if (lightningTimer == 0)
		{
			repeat(irandom_range(6,9))
			{
				scr_MKSS_ParticleSet_LightningBall(x+irandom_range(-16,16),y+irandom_range(-4,4),random_range(.2,2)*sign(hsp),random_range(-.15,.15));
			}
			instance_destroy();
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}
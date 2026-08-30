///@description MKSS - Attack - Grand Wheelie - Fire - Step

function scr_MKSS_Attack_GrandWheelie_Fire_Step()
{
	if (!localPause)
	{
		#region Destroy Timer
		if (max(destroyTimer - speedMultFinal,0) == 0)
		{
			scr_MKSS_ParticleSet_Sparkle(x,y);
		}
		#endregion
	}
}
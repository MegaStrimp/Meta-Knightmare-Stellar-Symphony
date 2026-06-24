///@description MKSS - Attack - Galaxia - Finisher - Step

function scr_MKSS_Attack_Galaxia_Finisher_Step()
{
	#region Afterimage Timer
	if (afterimageTimer != -1)
	{
		afterimageTimer = max(afterimageTimer - speedMultFinal,0);
		if (afterimageTimer == 0)
		{
			scr_MKSS_ParticleSet_Afterimage(,,1 * -dirX * speedMultFinal,,,,,-1,0);
				
			afterimageTimer = afterimageTimerMax;
		}
	}
	#endregion
}
///@description MKSS - Attack - Buzzcut - Chainlings - Step

function scr_MKSS_Attack_Buzzcut_Chainlings_Step()
{
	if (!localPause)
	{
		#region Afterimage Timer
		if (afterimageTimer != -1)
		{
			afterimageTimer = max(afterimageTimer - speedMultFinal,0);
			if (afterimageTimer == 0)
			{
				scr_MKSS_ParticleSet_Afterimage(,,,,,,,-1,0);
				
				afterimageTimer = afterimageTimerMax;
			}
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}
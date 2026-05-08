///@description MKSS - Enemy - Step - Normal

function scr_MKSS_Enemy_Step_Normal()
{
	if (!global.pauseFinal)
	{
		#region Enemy Healthbar Middle Timer
		if (hpHealthbarMiddleTimer != -1)
		{
			hpHealthbarMiddleTimer = max(hpHealthbarMiddleTimer - speedMultFinal,0);
			if (hpHealthbarMiddleTimer == 0)
			{
				hpHealthbarMiddleTimer = -1;
			}
		}
		#endregion
		
		#region Enemy Healthbar Shake Timer
		if (hpHealthbarShakeTimer != -1)
		{
			hpHealthbarShakeTimer = max(hpHealthbarShakeTimer - speedMultFinal,0);
			if (hpHealthbarShakeTimer == 0)
			{
				hpHealthbarShakeTimer = -1;
			}
		}
		#endregion
		
		#region Enemy Healthbar
		if (healthbarFill)
		{
			if (!audio_is_playing(snd_MKSS_BossHealth)) scr_PlaySfx(snd_MKSS_BossHealth);
			hpHealthbar = min(hp,hpHealthbar + healthbarFillSpeed);
			hpHealthbarMiddle = hpHealthbar;
			if (hpHealthbar == hp) healthbarFill = false;
		}
		else
		{
			var hpHealthbarTarget = max(0,hp);
			hpHealthbar = lerp(hpHealthbar,hpHealthbarTarget,.2);
			if (hpHealthbarMiddleTimer == -1) hpHealthbarMiddle = lerp(hpHealthbarMiddle,hpHealthbarTarget,.2);
		}
		#endregion
	}
}
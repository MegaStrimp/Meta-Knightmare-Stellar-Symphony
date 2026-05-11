/// @description Main

if (!localPause)
{
	#region Destroy Timer
	if (destroyTimer != -1)
	{
		destroyTimer = max(destroyTimer - speedMultFinal,0);
		if (destroyTimer == 0)
		{
			scr_PlaySfx(snd_MKSS_Explosion1);
			
			scr_MKSS_ParticleSet_Explosion3(x,y);
			
			scr_MKSS_Switch_Node_Destroy();
			if (activationScript != -1) script_execute(activationScript);
			
			instance_destroy();
			
			destroyTimer = -1;
		}
	}
	#endregion
}
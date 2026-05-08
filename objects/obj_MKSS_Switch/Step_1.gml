///@description Begin Step

#region Variables
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;
localPause = global.pauseFinal;
#endregion

#region Flags
flag_SwitchActive = false;
#endregion

if (!localPause)
{
	#region Activate
	if (!active)
	{
		var repeatableActive = false;
		
		if (isEnemy)
		{
			with (obj_Enemy)
			{
				if (place_meeting(x,y,other))
				{
					repeatableActive = true;
					other.flag_SwitchActive = true;
					other.active = true;
				}
			}
			
			with (obj_Attack)
			{
				if ((isEnemy) and (place_meeting(x,y,other)))
				{
					repeatableActive = true;
					other.flag_SwitchActive = true;
					other.active = true;
				}
			}
		}
		else
		{
			with (obj_Player)
			{
				if (place_meeting(x,y,other))
				{
					repeatableActive = true;
					other.flag_SwitchActive = true;
					other.active = true;
				}
			}
			
			with (obj_Attack)
			{
				if ((!isEnemy) and (place_meeting(x,y,other)))
				{
					repeatableActive = true;
					other.flag_SwitchActive = true;
					other.active = true;
				}
			}
		}
		
		if ((switchType == 1) and (!repeatableActive)) active = false;
	}
	
	if (flag_SwitchActive)
	{
		var sfx = scr_PlaySfx(snd_MKSS_Switch);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		if (activationScript != -1) script_execute(activationScript);
	}
	#endregion
}
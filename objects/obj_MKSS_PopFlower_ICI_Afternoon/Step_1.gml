///@description Begin Step

#region Variables
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;
localPause = global.pauseFinal;
#endregion

#region Shadow
shadowAlphaTarget = 0;

if (position_meeting(x,y,obj_MKSS_ShadowArea)) shadowAlphaTarget = 1;

shadowAlpha = lerp(shadowAlpha,shadowAlphaTarget,.1);

if (shadowAlpha < 1) shadowAlphaFinal = .66;
if (shadowAlpha < .66) shadowAlphaFinal = .33;
if (shadowAlpha < .33) shadowAlphaFinal = 0;
#endregion

#region Flags
flag_FlowerActive = false;
#endregion

if (!localPause)
{
	#region Activate
	if (!active)
	{
		with (obj_Player)
		{
			if (place_meeting(x,y,other))
			{
				other.flag_FlowerActive = true;
				other.active = true;
				
				var targetOwner = id;
			}
		}
		
		with (obj_Attack)
		{
			if ((!isEnemy) and (place_meeting(x,y,other)))
			{
				other.flag_FlowerActive = true;
				other.active = true;
				
				var targetOwner = owner;
			}
		}
	}
	
	if (flag_FlowerActive)
	{
		var sfx = scr_PlaySfx(snd_MKSS_PopFlower);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		sprite_index = sprBloom;
		image_index = 0;
		
		scr_MKSS_Score_Add(points);
		
		if (activationScript != -1) script_execute(activationScript,targetOwner);
	}
	#endregion
}
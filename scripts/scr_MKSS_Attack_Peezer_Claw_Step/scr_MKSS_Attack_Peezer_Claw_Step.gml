///@description MKSS - Attack - Peezer - Claw - Step

function scr_MKSS_Attack_Peezer_Claw_Step()
{
	#region Audio
	if ((!click1) and (floor(image_index) == 2))
	{
		var sfx = scr_PlaySfx(snd_MKSS_PeezerClick);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		click1 = true;
		click2 = false;
	}
	
	if ((!click2) and (floor(image_index) == 8))
	{
		var sfx = scr_PlaySfx(snd_MKSS_PeezerClick);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		click2 = true;
		click1 = false;
	}
	#endregion
}
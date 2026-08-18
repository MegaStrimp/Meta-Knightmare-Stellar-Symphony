///@description Main

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	#region Movement
	x = lerp(x,targetX,.01);
	#endregion
	
	#region Audio
	var soundVolume = max(0,1 - (abs(obj_Player.x - x) / 240)) * global.soundVolume;
	if (global.audioMuted) soundVolume = 0;
	
	if (!audio_is_playing(ambience)) ambience = scr_PlaySfx(snd_MKSS_BarrierAmbience);
    audio_sound_gain(ambience,soundVolume,0);
	#endregion
	
	#region Animation
	image_speed = speedMultFinal;
	#endregion
}
else
{
	image_speed = 0;
}
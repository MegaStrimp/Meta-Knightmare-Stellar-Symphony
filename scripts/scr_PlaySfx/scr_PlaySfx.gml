///@description Play Sfx

function scr_PlaySfx(soundID,isLooping = false)
{
	if (audio_is_playing(soundID)) audio_stop_sound(soundID);
	var sound = audio_play_sound(soundID,0,isLooping);
	
	return sound;
}
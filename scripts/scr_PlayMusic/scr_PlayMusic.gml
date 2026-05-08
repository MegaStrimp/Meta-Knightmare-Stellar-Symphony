///@description Play Music

function scr_PlayMusic(musicID,isLooping = true)
{
	audio_stop_sound(global.musicPlaying);
	global.musicPlaying = audio_play_sound(musicID,0,isLooping);
}
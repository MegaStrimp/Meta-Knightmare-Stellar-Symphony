///@description MKSS - Enemy Arena - End Script - Starry Shores - Gigant Edge

function scr_MKSS_EnemyArena_EndScript_StarryShores_GigantEdge()
{
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starryShores"]);
	
	audio_sound_set_track_position(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "starryShores"]].timestamps[0]);
	
	scr_Music_SetFade(1,,0);
}
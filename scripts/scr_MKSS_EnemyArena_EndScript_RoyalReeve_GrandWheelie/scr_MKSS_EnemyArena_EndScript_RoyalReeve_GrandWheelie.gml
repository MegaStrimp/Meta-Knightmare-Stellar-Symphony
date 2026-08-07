///@description MKSS - Enemy Arena - End Script - Royal Reeve - Grand Wheelie

function scr_MKSS_EnemyArena_EndScript_RoyalReeve_GrandWheelie()
{
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "royalReeve"]);
	
	audio_sound_set_track_position(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "royalReeve"]].timestamps[0]);
	
	scr_Music_SetFade(1,,0);
}
///@description MKSS - Enemy Arena - End Script - Royal Reeve - Grand Wheelie

function scr_MKSS_EnemyArena_EndScript_RoyalReeve_GrandWheelie()
{
	///STRIMPTODO Unskippable Cutscene
	
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "royalReeve"]);
	
	audio_sound_set_track_position(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "royalReeve"]].timestamps[0]);
	
	scr_Music_SetFade(1,,0);
	
	scr_MKSS_Door_Spawn(424,88,rm_MKSS_RoyalReeve_7);
}
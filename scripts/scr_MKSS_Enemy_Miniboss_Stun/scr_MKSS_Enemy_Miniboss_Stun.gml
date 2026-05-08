///@description MKSS - Enemy - Music - Miniboss Stun

function scr_MKSS_Enemy_Miniboss_Stun()
{
	if (!global.MKSS_MinibossIsStunned)
	{
		
		if (audio_sound_get_asset(global.musicPlaying) == global.MKSS_MusicList[global.MKSS_MusicIDs[? "miniboss"]].audio)
		{
			audio_sound_loop_end(global.musicPlaying,0);
			audio_sound_set_track_position(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "miniboss"]].timestamps[0]);
		}
		else if (audio_sound_get_asset(global.musicPlaying) == global.MKSS_MusicList[global.MKSS_MusicIDs[? "arenaBattle"]].audio)
		{
			audio_sound_set_track_position(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "arenaBattle"]].timestamps[0]);
		}
		
		global.MKSS_MinibossIsStunned = true;
	}
}
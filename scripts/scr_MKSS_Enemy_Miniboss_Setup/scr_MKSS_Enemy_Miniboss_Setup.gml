///@description MKSS - Enemy - Miniboss - Setup

function scr_MKSS_Enemy_Miniboss_Setup(targetPlayBossTheme)
{
	if (!global.MKSS_MinibossActive)
	{
		#region Variables
		global.MKSS_MinibossActive = true;
		global.MKSS_MinibossIsStunned = false;
		#endregion
		
		#region Music
		if (targetPlayBossTheme)
		{
			global.MKSS_MusicPlayingTimestamp = audio_sound_get_track_position(global.musicPlaying);
			
			scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "miniboss"]);
			
			audio_sound_loop_end(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "miniboss"]].timestamps[0]);
		}
		#endregion
	}
}
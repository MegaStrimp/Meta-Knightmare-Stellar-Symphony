///@description MKSS - Music - Play

function scr_MKSS_Music_Play(targetID)
{
	if (audio_sound_get_asset(global.musicPlaying) != global.MKSS_MusicList[targetID].audio)
	{
		#region Unlock
		global.MKSS_MusicList[targetID].isUnlocked = true;
		#endregion
		
		#region Play
		scr_PlayMusic(global.MKSS_MusicList[targetID].audio);
		#endregion
	}
}
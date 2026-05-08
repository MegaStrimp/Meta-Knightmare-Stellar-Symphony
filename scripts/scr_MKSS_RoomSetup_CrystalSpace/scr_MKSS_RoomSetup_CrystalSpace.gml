///@description MKSS - Room Setup - Crystal Space

function scr_MKSS_RoomSetup_CrystalSpace()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "crystalSpace"]);
	
	audio_sound_loop_end(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "crystalSpace"]].timestamps[0]);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_CrystalSpace);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Crystal Space",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}
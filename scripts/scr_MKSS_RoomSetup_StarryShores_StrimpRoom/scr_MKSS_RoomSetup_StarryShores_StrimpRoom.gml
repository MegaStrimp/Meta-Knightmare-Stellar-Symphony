///@description MKSS - Room Setup - Starry Shores - Strimp Room

function scr_MKSS_RoomSetup_StarryShores_StrimpRoom()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "starryShores_StrimpRoom"]);
	#endregion
	
	#region Background
	instance_create_depth(0,0,layer_get_depth(layer_get_id("Background")) - 1,obj_MKSS_Background_KSWUnderwater);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("???",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}
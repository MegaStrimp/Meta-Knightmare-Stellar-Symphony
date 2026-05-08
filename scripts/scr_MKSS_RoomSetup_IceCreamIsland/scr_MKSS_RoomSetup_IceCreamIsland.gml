///@description MKSS - Room Setup - Ice Cream Island - First Time

function scr_MKSS_RoomSetup_IceCreamIsland()
{
	#region Music
	scr_MKSS_Music_Play(global.MKSS_MusicIDs[? "iceCreamIsland"]);
	#endregion
	
	#region Ambience
	if (!instance_exists(obj_MKSS_OceanAmbience)) instance_create_depth(0,0,0,obj_MKSS_OceanAmbience);
	#endregion
	
	#region Background
	scr_Camera_SetBackground(scr_MKSS_SetBackground_IceCreamIsland);
	#endregion
	
	#region Screen Setup
	global.gameWidthTarget = global.gameWidthDefault;
	global.gameHeightTarget = global.gameHeightDefault;
	#endregion
	
	#region Discord
	scr_Discord_Setup("Ice Cream Island",-1,"icon",global.gameTitle,"strimp","From Strimp's Kitchen");
	#endregion
}
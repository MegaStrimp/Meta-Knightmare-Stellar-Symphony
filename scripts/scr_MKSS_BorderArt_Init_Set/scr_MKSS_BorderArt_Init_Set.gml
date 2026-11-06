///@description MKSS - Border Art - Init - Set

function scr_MKSS_BorderArt_Init_Set()
{
	#region Setup
	global.MKSS_BorderArtCount = 0;
	
	global.MKSS_BorderArtList = [];
	global.MKSS_BorderArtIDs = ds_map_create();
	#endregion
	
	#region Add BorderArts Here
	scr_MKSS_BorderArt_Init_Add("dynamic","Dynamic",MKSS_BorderArtSettings.dynamic);
	scr_MKSS_BorderArt_Init_Add("random","Random",MKSS_BorderArtSettings.randomized);
	scr_MKSS_BorderArt_Init_Add("none","None",MKSS_BorderArtSettings.none);
	//STRIMPTODO add border art, remove temps
	scr_MKSS_BorderArt_Init_Add("default","Default",bg_MKSS_AboveHalberd);
	scr_MKSS_BorderArt_Init_Add("androidPort","Android Port",bg_MKSS_IceCreamIsland);
	#endregion
}
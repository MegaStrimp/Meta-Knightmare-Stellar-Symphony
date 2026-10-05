///@description Stage - Ice Cream Island - Turn Afternoon

function scr_Stage_IceCreamIsland_TurnAfternoon()
{
	script_execute(scr_MKSS_RoomSetup_IceCreamIsland,true);
	
	tilemap_tileset(layer_tilemap_get_id(layer_get_id("WaterTopTiles")),ts_MKSS_WaterAfternoon);
	
	tilemap_tileset(layer_tilemap_get_id(layer_get_id("WaterTiles")),ts_MKSS_WaterAfternoon);
	
	tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles")),ts_MKSS_IceCreamAfternoon);
	
	with (obj_MKSS_BgEnv_IceCreamPalm)
	{
		instance_create_depth(xstart,ystart,depth,obj_MKSS_BgEnv_IceCreamPalm_Afternoon);
		
		instance_destroy();
	}
	
	with (obj_MKSS_BgEnv_IceCreamFlower)
	{
		instance_create_depth(xstart,ystart,depth,obj_MKSS_BgEnv_IceCreamFlower_Afternoon);
		
		instance_destroy();
	}
	
	with (obj_MKSS_BgEnv_WaterShine)
	{
		instance_create_depth(xstart,ystart,depth,obj_MKSS_BgEnv_WaterShine_Afternoon);
		
		instance_destroy();
	}
}
///@description Metal Block - Death - Break Metal

function scr_MKSS_MetalBlock_Death_BreakMetal()
{
	with (obj_MKSS_MetalBlock)
	{
		if (connectionNum == connectionNum)
		{
			if (place_meeting(x + global.gameTileSize,y,other)) destroyTimer = destroyTimerMax;
			if (place_meeting(x - global.gameTileSize,y,other)) destroyTimer = destroyTimerMax;
			if (place_meeting(x,y + global.gameTileSize,other)) destroyTimer = destroyTimerMax;
			if (place_meeting(x,y - global.gameTileSize,other)) destroyTimer = destroyTimerMax;
		}
	}
}
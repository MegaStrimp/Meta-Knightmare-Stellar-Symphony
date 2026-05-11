///@description Switch - Node - Destroy

function scr_MKSS_Switch_Node_Destroy()
{
	with (obj_MKSS_Switch_Node)
	{
		if (switchNetworkNum == switchNetworkNum)
		{
			if (place_meeting(x + global.gameTileSize,y,other)) destroyTimer = destroyTimerMax;
			if (place_meeting(x - global.gameTileSize,y,other)) destroyTimer = destroyTimerMax;
			if (place_meeting(x,y + global.gameTileSize,other)) destroyTimer = destroyTimerMax;
			if (place_meeting(x,y - global.gameTileSize,other)) destroyTimer = destroyTimerMax;
		}
	}
}
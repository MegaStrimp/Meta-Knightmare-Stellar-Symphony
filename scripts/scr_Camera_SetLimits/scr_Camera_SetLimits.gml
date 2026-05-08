///@description Camera - Set Screenshake

function scr_Camera_SetLimits(x1Limit = -1,x2Limit = -1,y1Limit = -1,y2Limit = -1)
{
	with (global.camera)
	{
		cameraX1Limit = x1Limit;
		cameraX2Limit = x2Limit;
		cameraY1Limit = y1Limit;
		cameraY2Limit = y2Limit;
	}
}
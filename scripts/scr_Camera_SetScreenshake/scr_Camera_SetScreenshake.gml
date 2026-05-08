///@description Camera - Set Screenshake

function scr_Camera_SetScreenshake(shakeXVal = 0,shakeYVal = 0)
{
	with (global.camera)
	{
		shakeX = shakeXVal;
		shakeY = shakeYVal;
	}
}
///@description Camera - State - Follow Position

function scr_Camera_State_FollowPosition()
{
	#region Camera Position
	var targetCameraX = followingPosition_X - (global.gameWidth / 2) + xOffset - global.hudCameraXOffset;
	var targetCameraY = followingPosition_Y - (global.gameHeight / 2) + yOffset - global.hudCameraYOffset;
	
	cameraX = targetCameraX;
	cameraY = targetCameraY;
	#endregion
	
	#region Set Camera
	cameraX = clamp(cameraX,min(0,xOffset),room_width + max(0,xOffset) - global.gameWidth) + shakeXFinal;
	cameraY = clamp(cameraY,min(0,yOffset),room_height + max(0,yOffset) - global.gameHeight) + shakeYFinal;
	
	camera_set_view_pos(mainView,cameraX,cameraY);
	#endregion
}
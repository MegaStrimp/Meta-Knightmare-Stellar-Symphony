///@description Room End

#region Reset Variables
cameraX1Limit = -1;
cameraX2Limit = -1;
cameraY1Limit = -1;
cameraY2Limit = -1;
limitedXOffset1 = cameraX;
limitedXOffset2 = cameraX + global.gameWidth;
limitedYOffset1 = cameraY;
limitedYOffset2 = cameraY + global.gameHeight;

shakeX = 0;
shakeY = 0;

isActive = true;
followingObject = -1;
followingPosition_X = 0;
followingPosition_Y = 0;
followingPosition_X_Target = 0;
followingPosition_Y_Target = 0;
followingPosition_Lerp = .1;

xOffset = 0;
yOffset = 0;

scr_Camera_SetState(scr_Camera_State_FollowObject);
#endregion
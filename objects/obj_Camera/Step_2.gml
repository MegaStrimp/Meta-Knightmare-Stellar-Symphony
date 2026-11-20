///@description End Step

#region Shake
scr_Camera_Shake();
#endregion

#region Follow Position
followingPosition_X = lerp(followingPosition_X,followingPosition_X_Target,followingPosition_Lerp);
followingPosition_Y = lerp(followingPosition_Y,followingPosition_Y_Target,followingPosition_Lerp);
#endregion

#region Camera Setup
if (isActive)
{
	if (cameraState != -1) script_execute(cameraState);
}
#endregion

#region Background Control
if (backgroundState != -1) script_execute(backgroundState);
#endregion
///@description Camera - Follow Position

function scr_Camera_FollowPosition(targetFollowingPosition_X,targetFollowingPosition_Y,targetFollowingPosition_Lerp = .02,isSmooth = true)
{
	with (global.camera)
	{
		followingPosition_X_Target = targetFollowingPosition_X;
		followingPosition_Y_Target = targetFollowingPosition_Y;
		followingPosition_Lerp = targetFollowingPosition_Lerp;
		
		if (isSmooth)
		{
			followingPosition_X = cameraX + (global.gameWidth / 2);
			followingPosition_Y = cameraY + (global.gameHeight / 2);
		}
		else
		{
			followingPosition_X = targetFollowingPosition_X;
			followingPosition_Y = targetFollowingPosition_Y;
		}
	}
}
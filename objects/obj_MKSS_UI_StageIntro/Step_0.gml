///@description Main

#region Overlay
overlayAlpha = lerp(overlayAlpha,overlayAlphaTarget,.2);
#endregion

#region Sheets
sheetX = (sheetX + sheetSpd) % sheetWidth;
sheetY = lerp(sheetY,sheetYTarget,.1);
#endregion

#region Decals
decalLength = lerp(decalLength,decalLengthTarget,.2);
#endregion

#region Stage Title
stageTitleX += lengthdir_x(stageTitleSpd,stageTitleAngle);
stageTitleY += lengthdir_y(stageTitleSpd,stageTitleAngle);
#endregion

#region Particle Timer
if (particleTimer != -1)
{
	particleTimer = max(particleTimer - speedMultFinal,0);
	if (particleTimer == 0)
	{
		scr_MKSS_ParticleSet_StageIntroStars(camera_get_view_x(mainView) + irandom_range(0,global.gameWidth),camera_get_view_y(mainView) + irandom_range(0,global.gameHeight),45)
		
		particleTimer = particleTimerMax;
	}
}
#endregion

#region End Timer
if ((endTimer <= endTimerMax / 1.5) and ((input_check_pressed("A",playerNum)) or (input_check_pressed("start",playerNum)))) endTimer = 0;

if (endTimer != -1)
{
	endTimer = max(endTimer - speedMultFinal,0);
	if (endTimer == 0)
	{
		global.hasHud = true;
		global.canGamePause = true;
		global.MKSS_StageIntroPlaying = false;
		
		overlayAlphaTarget = 0;
		sheetYTarget = 20;
		decalLengthTarget = -50;
		stageTitleSpd = 8;
		particleTimer = -1;
		
		endTimer = -1;
	}
}
#endregion

#region Destroy Timer
if (destroyTimer != -1)
{
	destroyTimer = max(destroyTimer - speedMultFinal,0);
	if (destroyTimer == 0)
	{
		instance_destroy();
		
		destroyTimer = -1;
	}
}
#endregion
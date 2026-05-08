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
textOffset = lerp(textOffset,textOffsetTarget,.1);
#endregion

#region Selection
if ((!instance_exists(obj_Transition)) and (hintOffsetTimer == -1) and (endTimer == -1) and (destroyTimer == -1))
{
	if ((input_check_pressed("A",playerNum)) or (input_check_pressed("start",playerNum)))
	{
		scr_PlaySfx(snd_MKSS_ButtonYes);
		
		endTimer = 0;
	}
	
	if (input_check_pressed("B",playerNum))
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		endStage = true;
		
		scr_GoToRoom(rm_MKSS_BattleshipHalberd,false);
	}
}
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

#region Hint Offset
hintOffset = lerp(hintOffset,32 * (hintOffsetTimer != -1),.1);
#endregion

#region Hint Offset Timer
if (hintOffsetTimer != -1)
{
	hintOffsetTimer = max(hintOffsetTimer - speedMultFinal,0);
	if (hintOffsetTimer == 0)
	{
		hintOffsetTimer = -1;
	}
}
#endregion

#region End Timer
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
		textOffsetTarget = -global.gameWidth;
		stageTitleSpd = 8;
		particleTimer = -1;
		hintOffsetTimer = 300;
		destroyTimer = 30;
		
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
		audio_sound_loop_end(global.musicPlaying,0);
		audio_sound_loop_start(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "crystalSpace"]].timestamps[1]);
		
		audio_sound_set_track_position(global.musicPlaying,global.MKSS_MusicList[global.MKSS_MusicIDs[? "crystalSpace"]].timestamps[0]);
		
		instance_destroy();
		
		destroyTimer = -1;
	}
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
///@description Draw End

#region Hud
if (global.hasHud)
{
	if (hudDraw != -1) script_execute(hudDraw);
}
#endregion

#region Pause
if (global.gamePause)
{
	#region Pause AI Draw GUI
	if (gamePauseAIDrawEnd != -1) script_execute(gamePauseAIDrawEnd);
	#endregion
}
#endregion
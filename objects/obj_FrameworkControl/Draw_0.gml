///@description Draw

#region Pause
if (global.gamePause)
{
	#region Pause AI Draw
	if (gamePauseAIDraw != -1) script_execute(gamePauseAIDraw);
	#endregion
}
#endregion
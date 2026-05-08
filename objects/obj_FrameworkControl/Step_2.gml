///@description End Step

#region Global Pause Final
var doesPauseScript = false;
if (global.pauseScript != -1) doesPauseScript = script_execute(global.pauseScript);

global.pauseFinal = ((global.pause) or (doesPauseScript) or (global.gamePause) or (global.freezeFrame));
#endregion

#region Hud
if (hudEndStep != -1) script_execute(hudEndStep);
#endregion
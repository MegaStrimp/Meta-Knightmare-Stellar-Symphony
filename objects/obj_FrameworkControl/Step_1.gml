///@description Begin Step

#region Variables
global.currentTimePausable += 1 * !global.pauseFinal;
//global.deltaTime = delta_time / 1000000 * room_speed;
global.deltaTime = 1;
speedMultFinal = global.speedMultGlobal * global.deltaTime;
//STRIMPTODO Add proper delta time
#endregion

#region Game Pause
var inGameplay = instance_exists(obj_Player); //STRIMPTODO Add this to Execute script instead, remove inGameplay requirement here

if (global.gamePause)
{
	#region Pause AI Step
	if (gamePauseAIStep != -1) script_execute(gamePauseAIStep);
	#endregion
}
else
{
	if (inGameplay)
	{
		#region Pause AI Execute
		if (gamePauseAIExecute != -1) script_execute(gamePauseAIExecute);
		#endregion
	}
}

#region Game Pause Delay Timer
if (gamePauseDelayTimer != -1)
{
	gamePauseDelayTimer = max(gamePauseDelayTimer - speedMultFinal,0);
	if (gamePauseDelayTimer == 0)
	{
		gamePauseDelayTimer = -1;
	}
}
#endregion

#region Game Pause End Timer
if (gamePauseEndTimer != -1)
{
	gamePauseEndTimer = max(gamePauseEndTimer - speedMultFinal,0);
	if (gamePauseEndTimer == 0)
	{
		global.gamePause = false;
		
		audio_resume_all();
		
		if (gamePauseAIClean != -1) script_execute(gamePauseAIClean);
		
		gamePauseEndTimer = -1;
	}
}
#endregion
#endregion

#region Screen Setup
if ((global.windowScale != global.windowScaleTarget) or (global.gameWidth != global.gameWidthTarget) or (global.gameHeight != global.gameHeightTarget)) scr_Screen_Setup(global.gameWidthTarget,global.gameHeightTarget,global.windowScaleTarget);
#endregion

#region Audio Control
if (keyboard_check_pressed(ord("M")))
{
	global.audioMuted = !global.audioMuted;
}

global.musicVolume_Fade = lerp(global.musicVolume_Fade,global.musicVolume_FadeTarget,global.musicVolume_FadeSpeed);
global.soundVolume_Fade = lerp(global.soundVolume_Fade,global.soundVolume_FadeTarget,global.soundVolume_FadeSpeed);

var gamePaused = 1;

var audioArray = tag_get_assets("Sound Effect");
var loopLength = array_length(audioArray);
for (var i = 0; i < loopLength; i++)
{
    var soundVolume = global.soundVolume;
	if (global.audioMuted) soundVolume = 0;
	
    audio_sound_gain(asset_get_index(audioArray[i]),soundVolume,0);
}

audioArray = tag_get_assets("Music");
loopLength = array_length(audioArray);
for (var i = 0; i < loopLength; i++)
{
	var musicVolume = global.musicVolume * gamePaused * global.musicVolume_Fade;
	if (global.audioMuted) musicVolume = 0;
	
    audio_sound_gain(asset_get_index(audioArray[i]),musicVolume,0);
}
#endregion
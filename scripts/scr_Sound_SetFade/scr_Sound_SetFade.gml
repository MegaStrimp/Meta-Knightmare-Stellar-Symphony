///@description Sound - Set Fade

function scr_Sound_SetFade(targetFadeTarget,targetFadeSpeed = .1,targetFade = global.soundVolume_Fade)
{
	global.soundVolume_Fade = targetFade;
	global.soundVolume_FadeTarget = targetFadeTarget;
	global.soundVolume_FadeSpeed = targetFadeSpeed;
}
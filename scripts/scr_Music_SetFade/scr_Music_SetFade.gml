///@description Music - Set Fade

function scr_Music_SetFade(targetFadeTarget,targetFadeSpeed = .1,targetFade = global.musicVolume_Fade)
{
	global.musicVolume_Fade = targetFade;
	global.musicVolume_FadeTarget = targetFadeTarget;
	global.musicVolume_FadeSpeed = targetFadeSpeed;
}
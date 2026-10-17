///@description MKSS - Weapon - Buzzcut - Clean

function scr_MKSS_Weapon_Buzzcut_Clean()
{
	#region Stop Idle Sound
	if (audio_is_playing(buzzcut_IdleSound)) audio_stop_sound(buzzcut_IdleSound)
	#endregion
}
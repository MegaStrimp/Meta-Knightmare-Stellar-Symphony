///@description MKSS - Balloon - Activation - SS Strimp

function scr_MKSS_Balloon_Activation_SSStrimp()
{
	audio_stop_sound(global.musicPlaying);
	scr_PlaySfx(snd_MKSS_MarxLaugh1);
	
	scr_MKSS_UI_BackgroundOverlay_Create(localFreezeFrameTimer);
	
	with (obj_Door)
	{
		targetRoom = rm_MKSS_StarryShores_StrimpRoom;
	}
}
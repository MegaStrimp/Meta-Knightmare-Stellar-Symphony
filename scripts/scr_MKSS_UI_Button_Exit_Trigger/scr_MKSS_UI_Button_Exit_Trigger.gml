///@description MKSS - UI - Button - Exit - Trigger

function scr_MKSS_UI_Button_Exit_Trigger()
{
	var sfx = scr_PlaySfx(snd_MKSS_ButtonYes);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	game_end();
}
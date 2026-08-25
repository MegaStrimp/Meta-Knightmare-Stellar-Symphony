///@description MKSS - UI - Button - Twitter - Trigger

function scr_MKSS_UI_Button_Twitter_Trigger()
{
	var sfx = scr_PlaySfx(snd_MKSS_ButtonYes);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	url_open("https://twitter.com/mega_strimp");
}
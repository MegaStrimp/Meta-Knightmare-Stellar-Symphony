///@description MKSS - UI - Button - Github - Trigger

function scr_MKSS_UI_Button_Github_Trigger()
{
	var sfx = scr_PlaySfx(snd_MKSS_ButtonYes);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	url_open("https://github.com/MegaStrimp/Meta-Knightmare-Stellar-Symphony");
}
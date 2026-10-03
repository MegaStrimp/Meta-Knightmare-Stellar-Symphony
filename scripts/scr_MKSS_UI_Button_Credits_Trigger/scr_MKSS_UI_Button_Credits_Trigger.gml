///@description MKSS - UI - Button - Credits - Trigger

function scr_MKSS_UI_Button_Credits_Trigger()
{
	var sfx = scr_PlaySfx(snd_MKSS_DoorEnter);
	//audio_sound_pitch(sfx,random_range(.85,1.15));
	
	scr_GoToRoom(rm_MKSS_Menu_Credits,true);
}
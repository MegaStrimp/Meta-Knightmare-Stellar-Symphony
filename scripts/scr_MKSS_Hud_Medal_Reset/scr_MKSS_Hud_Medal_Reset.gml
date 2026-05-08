///@description MKSS - Hud - Medal - Reset

function scr_MKSS_Hud_Medal_Reset()
{
	with (obj_FrameworkControl)
	{
		hud_MedalTier = -1;
		hud_MedalSprite = spr_MKSS_UI_Medal_None;
		hud_MedalIndex = 0;
		hud_MedalSpeed = sprite_get_speed(hud_MedalSprite) / 60;
		hud_MedalSpeedMult = 1;
		hud_MedalNumber = sprite_get_number(hud_MedalSprite);
	}
}
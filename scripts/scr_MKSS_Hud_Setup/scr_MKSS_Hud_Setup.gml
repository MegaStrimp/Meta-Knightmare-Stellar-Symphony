///@description MKSS - Hud - Setup

function scr_MKSS_Hud_Setup()
{
	#region Set Hud Scripts
	hudStep = scr_MKSS_Hud_Step;
	hudEndStep = scr_MKSS_Hud_EndStep;
	hudDrawGUI = scr_MKSS_Hud_DrawGUI;
	#endregion
	
	#region Initialize Hud Variables
	hud_LeftIcon = undefined;
	hud_MiddleIcon = undefined;
	hud_RightIcon = undefined;
	
	hud_WeaponBgIndex = 0;
	hud_WeaponBgSpeed = sprite_get_speed(spr_MKSS_Hud_Weapon_Bg) / 60;
	
	hud_SpecialEnabled = true;
	
	hud_MedalTier = -1;
	hud_MedalSprite = spr_MKSS_UI_Medal_None;
	hud_MedalIndex = 0;
	hud_MedalSpeed = sprite_get_speed(hud_MedalSprite) / 60;
	hud_MedalSpeedMult = 1;
	hud_MedalNumber = sprite_get_number(hud_MedalSprite);
	hud_MedalSparkleIndex = 0;
	hud_MedalSparkleSpeed = sprite_get_speed(spr_MKSS_Particle_SmallSparkle) / 60;
	hud_MedalSparkleNumber = sprite_get_number(spr_MKSS_Particle_SmallSparkle);
	hud_MedalSparkleXMax = 24;
	hud_MedalSparkleYMax = 24;
	hud_MedalSparkleVspMin = .2;
	hud_MedalSparkleVspMax = .5;
	hud_MedalSpinTimer = -1;
	hud_MedalSpinTimerMax = 300;
	
	metaPointCollectTimer = -1;
	metaPointCollectTimerMax = 5;
	#endregion
}
///@description Create

#region Initialize Variables
#region Object Attributes
isActive = !(global.MKSS_WeaponList[global.MKSS_WeaponIDs[? "galaxia"]].isUnlocked);
showTitle = false;

speedMultFinal = 1;
localPause = false;

xLimit = global.gameWidth;
spd = 5;

destroyTimer = -1;
destroyTimerMax = 360;
#endregion
#endregion

#region Activation
if (isActive)
{
	scr_Camera_SetLimits(-1,global.gameWidth,-1,-1);
	global.hasHud = false;
}
else
{
	scr_MKSS_UI_StageIntro_Create(spr_MKSS_UI_StageIntro_StageTitle_StarryShores);
	instance_destroy();
}
#endregion
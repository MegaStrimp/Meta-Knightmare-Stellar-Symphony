///@description Create

#region Initialize Variables
speedMultFinal = 1;
localPause = false;

targetStageID = -1;
targetUnlockedStageID = -1;
targetCollectibleID = -1;

gemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue;
crackSprite = spr_MKSS_ConcentratedGem_Crack_Blue;

gemTitle = "";
unlockTitle = "";

shakeTimer = -1;
shakeTimerMax = 15;

lastHitProjectile = -1;
knockbackLength = 0;
knockbackLengthMax = 8;
knockbackAngle = -1;

hpMax = 5;
hp = hpMax;

mask_index = spr_32x32Mask_MiddleOrigin;
#endregion
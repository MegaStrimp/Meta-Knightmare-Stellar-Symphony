///@description Create

#region Initialize Variables
speedMultFinal = 1;
localPause = false;

targetStageID = -1;
targetUnlockedStageID = -1;
targetCollectibleID = -1;

gemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue;

gemTitle = "";
unlockTitle = "";

lastHitProjectile = -1;
knockbackLength = 0;
knockbackLengthMax = 8;
knockbackAngle = -1;

hpMax = 3;
hp = hpMax;

mask_index = spr_32x32Mask_MiddleOrigin;

gemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue;
#endregion
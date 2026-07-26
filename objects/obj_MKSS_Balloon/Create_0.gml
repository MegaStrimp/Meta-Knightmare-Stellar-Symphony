///@description Create

#region Initialize Variables
#region Gameplay Variables
localPause = global.pauseFinal;
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;

dirY = choose(-1,1);

activationScript = -1;

freezeFrameForce = 2;
localFreezeFrameTimer = -1;
isDestroyed = false;

destroyOutsideView = false;

explodeSprite = spr_MKSS_Particle_BalloonExplode;

trackCheck = false;
#endregion

#region Component Setup
scr_Component_UpAndDown_Setup(.5,.02,60,60);
vsp = jumpspeed * -dirY * speedMultFinal;
#endregion

#region Palette List
paletteList = ds_list_create();

ds_list_add(paletteList,spr_MKSS_Balloon_Palette_Normal);
if (global.MKSS_StageList[global.MKSS_StageIDs[? "starryShores"]].isBeaten) ds_list_add(paletteList,spr_MKSS_Balloon_Palette_StarryShores);
if (global.MKSS_StageList[global.MKSS_StageIDs[? "royalReeve"]].isBeaten) ds_list_add(paletteList,spr_MKSS_Balloon_Palette_RoyalReeve);
if (global.MKSS_StageList[global.MKSS_StageIDs[? "livingLoom"]].isBeaten) ds_list_add(paletteList,spr_MKSS_Balloon_Palette_LivingLoom);
if (global.MKSS_StageList[global.MKSS_StageIDs[? "fissionFactory"]].isBeaten) ds_list_add(paletteList,spr_MKSS_Balloon_Palette_FissionFactory);
if (global.MKSS_StageList[global.MKSS_StageIDs[? "adAstra"]].isBeaten) ds_list_add(paletteList,spr_MKSS_Balloon_Palette_AdAstra);

ds_list_shuffle(paletteList);
palSprite = ds_list_find_value(paletteList,0);
palIndex = irandom_range(1,sprite_get_width(palSprite) - 1);

ds_list_destroy(paletteList);
#endregion
#endregion
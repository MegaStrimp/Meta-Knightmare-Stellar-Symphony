///@description Create

#region Initialize Variables
#region Gameplay Variables
localPause = global.pauseFinal;
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;

sprite_index = choose(spr_MKSS_BgEnv_IceCreamFlower_1,spr_MKSS_BgEnv_IceCreamFlower_2,spr_MKSS_BgEnv_IceCreamFlower_3);
palSprite = spr_MKSS_BgEnv_IceCreamFlower_Pal_Day;
palIndex = irandom_range(1,sprite_get_width(palSprite) - 1);
#endregion
#endregion
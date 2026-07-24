///@description Create

#region Initialize Variables
alpha = 1;

alphaTimer = -1;
alphaTimerMax = irandom_range(25,45);

sprite_index = choose(spr_MKSS_BgEnv_AboveHalberdThunder1,spr_MKSS_BgEnv_AboveHalberdThunder2);

scale = random_range(.35,1);
image_xscale = scale;
image_yscale = scale;
#endregion
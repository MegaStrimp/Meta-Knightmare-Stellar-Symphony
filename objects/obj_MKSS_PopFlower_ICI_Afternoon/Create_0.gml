///@description Create

#region Initialize Variables
#region Sprites
spriteSets =
[[spr_MKSS_PopFlower_ICI_1_Closed,spr_MKSS_PopFlower_ICI_1_Bloom,spr_MKSS_PopFlower_ICI_1_Open,[spr_MKSS_PopFlower_ICI_1_Palette_Afternoon1,spr_MKSS_PopFlower_ICI_1_Palette_Afternoon2]]];

var setIndex = choose(0,0);

sprClosed = spriteSets[setIndex][0];
sprBloom = spriteSets[setIndex][1];
sprOpen = spriteSets[setIndex][2];

palSprite = spriteSets[setIndex][3][irandom(array_length(spriteSets[setIndex][3]) - 1)];
#endregion

#region Object Attributes
speedMultFinal = 1;
localPause = false;

points = 10;

active = false;
activationScript = scr_MKSS_PopFlower_Activation_GiveMetaPoint;

shadowAlphaTarget = position_meeting(x,y,obj_MKSS_ShadowArea);
shadowAlpha = shadowAlphaTarget;
shadowAlphaFinal = shadowAlphaTarget;
#endregion
#endregion

#region Flags
flag_FlowerActive = false;
#endregion
///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Initialize Variables
#region Sprites
spriteSets =
[[spr_MKSS_PopFlower_SS_1_Closed,spr_MKSS_PopFlower_SS_1_Bloom,spr_MKSS_PopFlower_SS_1_Open,[spr_MKSS_PopFlower_SS_1_Palette1,spr_MKSS_PopFlower_SS_1_Palette2]],
[spr_MKSS_PopFlower_SS_2_Closed,spr_MKSS_PopFlower_SS_2_Bloom,spr_MKSS_PopFlower_SS_2_Open,[spr_MKSS_PopFlower_SS_2_Palette1,spr_MKSS_PopFlower_SS_2_Palette2]]];

var setIndex = irandom(array_length(spriteSets) - 1);

sprClosed = spriteSets[setIndex][0];
sprBloom = spriteSets[setIndex][1];
sprOpen = spriteSets[setIndex][2];

palSprite = spriteSets[setIndex][3][irandom(array_length(spriteSets[setIndex][3]) - 1)];
#endregion
#endregion
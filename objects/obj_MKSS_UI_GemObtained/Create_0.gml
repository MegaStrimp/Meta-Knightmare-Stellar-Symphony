///@description Create

#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Initialize Variables
playerNum = 0;

gemTitle = "Starry Shores [#224CF5]Blue Gem[/color] Obtained!";
unlockTitle = "[#0094FF]Starry Shores Enemy Ordeal[/color]";

alpha = 0;
alphaTarget = 1;

decalLengthTarget = 0;
decalLength = -50;

textOffset = -60;
textOffsetTarget = 0;

gemIndex = 0;
gemSpeed = sprite_get_speed(spr_MKSS_ConcentratedGem_Large) / 60;
gemNumber = sprite_get_number(spr_MKSS_ConcentratedGem_Large);

hintOffset = 32;
hintOffsetTimerMax = 90;
hintOffsetTimer = hintOffsetTimerMax;

endTimer = -1;
destroyTimer = -1;

gemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue;
#endregion
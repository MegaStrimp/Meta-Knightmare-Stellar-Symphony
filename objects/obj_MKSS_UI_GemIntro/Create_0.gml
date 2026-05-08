///@description Create

if (instance_exists(obj_Transition)) instance_destroy(obj_Transition);

#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Initialize Variables
global.hasHud = false;
global.canGamePause = false;
global.MKSS_StageIntroPlaying = true;

playerNum = 0;

overlayAlphaTarget = .5;
overlayAlpha = overlayAlphaTarget;

sheetX = 0;
sheetY = 0;
sheetYTarget = 0;
sheetSpd = 4;
sheetWidth = sprite_get_width(spr_MKSS_UI_StageIntro_Sheet);

decalLength = -50;
decalLengthTarget = 0;
decalPalette = -1;

title = "";
subtitle = "";
description = "";
textOffset = -60;
textOffsetTarget = 0;

stageScore = 0;
stageScoreFont = "[fnt_Advance]";
medalSprite = spr_MKSS_UI_Medal_None;

hintOffset = 32;
hintOffsetTimerMax = 90;
hintOffsetTimer = hintOffsetTimerMax;

particleTimer = 0;
particleTimerMax = 10;
endTimer = -1;
destroyTimer = -1;

endStage = false;
#endregion
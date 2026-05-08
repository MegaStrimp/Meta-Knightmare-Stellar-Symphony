///@description Create

if (instance_exists(obj_Transition)) instance_destroy(obj_Transition);

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

stageTitleSprite = spr_MKSS_UI_StageIntro_StageTitle_StarryShores;
stageTitleX = 80;
stageTitleY = 50;
stageTitleSpd = .4;
stageTitleAngle = 345;

particleTimer = 0;
particleTimerMax = 10;
endTimerMax = 240;
endTimer = endTimerMax;
destroyTimer = 480;
#endregion
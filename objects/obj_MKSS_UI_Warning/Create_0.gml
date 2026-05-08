///@description Create

#region Initialize Variables
topTextX = 0;
topTextY = 28;
topTextYTarget = 38;
topTextSpd = 1;
topTextWidth = sprite_get_width(spr_MKSS_UI_Warning_Text_Top);

bottomTextX = 0;
bottomTextY = 121;
bottomTextYTarget = 111;
bottomTextSpd = -1;
bottomTextWidth = sprite_get_width(spr_MKSS_UI_Warning_Text_Bottom);

middleTextLength = 0;
middleTextLengthTarget = 1;

decalWidth = 0;
decalWidthTarget = 240;

state = 0;
stateTimer = 240;
#endregion
///@description Create

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Other Variables
playerNum = 0;

titleOffset = 32;

hintOffset = 32;
hintOffsetTimerMax = 120;
hintOffsetTimer = hintOffsetTimerMax;

nextRoomTimer = -1;
nextRoomTimerMax = 90;

circleR = global.gameWidth + 20;

targetRoom = -1;

drawSurface = -1;
#endregion
#endregion
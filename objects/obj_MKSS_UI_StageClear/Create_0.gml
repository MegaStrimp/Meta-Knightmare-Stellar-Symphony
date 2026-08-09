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
nextRoomTimerMax = 45;

circleR = global.gameWidth + 20;

currentScore = -1;
scoreBonuses = [];

targetRoom_Next = -1;
targetRoom_Retry = -1;
targetRoom = -1;
#endregion
#endregion

#region Create Surface
if (!instance_exists(obj_MKSS_Surface_Planetarium)) instance_create_depth(0,0,0,obj_MKSS_Surface_Planetarium);
#endregion
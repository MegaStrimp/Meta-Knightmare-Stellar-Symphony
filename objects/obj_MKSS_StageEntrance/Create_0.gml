///@description Create

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Menu Variables
playerNum = 0;

targetRoom = -1;
isActive = false;
selection = 0;
ownerPedestal = -1;
canTeleport = false;

circleIndex = 0;
circleSpeed = sprite_get_speed(spr_MKSS_StageEntrance_Portal_Base) / 60;
circleNumber = sprite_get_number(spr_MKSS_StageEntrance_Portal_Base);
circleRadius = .2;
circleAngleWave = sine_wave(current_time / 4000,5,5,0);

particleTimer = -1;
particleTimerMax = 10;

isCompleted = false;
#endregion
#endregion
///@description Create

#region Initialize Variables
#region Object Attributes
/*
Switch Types

0 - One Press
1 - Repeatable
2 - Repeatable With Timer
*/
switchType = 0;
switchNetworkNum = 0;
isEnemy = false;

speedMultFinal = 1;
localPause = false;

active = false;
activationScript = -1;

repeatTimer = -1;
repeatTimerMax = 30;
#endregion
#endregion

#region Flags
flag_SwitchActive = false;
#endregion
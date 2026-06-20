///@description Create

#region Initialize Variables
#region Component Setup
scr_Component_ButtonInputTimer_Setup(5);
#endregion

#region Menu Variables
playerNum = 0;

isActive = false;
selection = 0;
ownerPedestal = -1;
canTeleport = false;

familiarBounceTimer = -1;
familiarBounceTimerMax = 5;

familiarList = ds_list_create();
familiarListCount = 0;

currentName = global.MKSS_FamiliarList[selection].name;
currentSprite = global.MKSS_FamiliarList[selection].sprite;
#endregion
#endregion
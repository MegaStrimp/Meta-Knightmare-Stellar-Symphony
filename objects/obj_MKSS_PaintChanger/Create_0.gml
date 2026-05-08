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

paintRollerSprite = spr_MKSS_PaintChanger_PaintRoller_Idle;
paintRollerCanSprite = spr_MKSS_PaintChanger_PaintRoller_Idle_Can;
paintRollerIndex = 0;
paintRollerNumber = sprite_get_number(spr_MKSS_PaintChanger_PaintRoller_Idle);
paintRollerSpeed = sprite_get_speed(spr_MKSS_PaintChanger_PaintRoller_Idle) / 60;
paintRollerOffset = 0;
paintRollerOffsetTarget = 0;

paintRollerTimer = -1;
paintRollerTimerMax = 30;

scratchX = x;
scratchY = y;
scratchIndex = 0;
scratchNumber = sprite_get_number(spr_MKSS_PaintChanger_Scratch);
scratchSpeed = sprite_get_speed(spr_MKSS_PaintChanger_Scratch) / 60;

scratchTimer = -1;
scratchTimerMax = 30;

dustTimer = -1;
dustTimerMax = 5;

sprayCanBounceTimer = -1;
sprayCanBounceTimerMax = 5;

paletteList = ds_list_create();
paletteListCount = 0;

currentName = global.MKSS_SprayPaintList[selection].name;
currentSprite = global.MKSS_SprayPaintList[selection].sprite;
#endregion
#endregion
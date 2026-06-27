///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "mrSandbag"];
hp = 1000;
points = 1;

canHurtPlayer = false;

freezeFrameForce = 2;

spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
#endregion

#region AI Scripts
enemyBeginStep = scr_MKSS_Enemy_BeginStep_Normal;
enemyStep = scr_MKSS_Enemy_Step_Normal;
#endregion
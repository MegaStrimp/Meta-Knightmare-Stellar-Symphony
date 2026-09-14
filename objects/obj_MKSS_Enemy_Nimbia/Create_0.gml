///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "nimbia"];
hp = MKSS_Base_EnemyHP_Boss;
points = MKSS_Base_EnemyPoints_Boss;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Boss;
isBoss = true;

pauseOutsideView = false;
canHaveKnockback = false;

freezeFrameForce = 2;

massDestructionScript = scr_MKSS_Cutscene_Preset_NimbiaMassDestruction;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
//sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion

#region AI Scripts
enemyBeginStep = scr_MKSS_Enemy_BeginStep_Normal;
enemyStep = scr_MKSS_Enemy_Step_Normal;
#endregion
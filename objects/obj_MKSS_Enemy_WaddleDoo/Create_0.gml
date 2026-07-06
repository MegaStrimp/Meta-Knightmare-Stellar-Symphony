///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "waddleDoo"];
hp = MKSS_Base_EnemyHP_Attacker;
points = MKSS_Base_EnemyPoints_Attacker;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Attacker;
metaPointsOnOverkill = floor(metaPointsOnDeath / 2);

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion
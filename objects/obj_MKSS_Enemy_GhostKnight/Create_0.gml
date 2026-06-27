///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "ghostKnight"];
hp = MKSS_Base_EnemyHP_Advanced;
points = MKSS_Base_EnemyPoints_Advanced;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Advanced;
metaPointsOnOverkill = floor(metaPointsOnDeath / 2);

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion
///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "bouncySis"];
hp = MKSS_Base_EnemyHP_Microboss;
points = MKSS_Base_EnemyPoints_Microboss;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Microboss;
metaPointsOnOverkill = floor(metaPointsOnDeath / 2);

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion
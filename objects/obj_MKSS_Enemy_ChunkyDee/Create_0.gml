///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "chunkyDee"];
hp = MKSS_Base_EnemyHP_Miniboss;
points = MKSS_Base_EnemyPoints_Miniboss;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Miniboss;
metaPointsOnOverkill = floor(metaPointsOnDeath / 2);
isBoss = true;
pauseOutsideView = false;
canHaveKnockback = false;

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion
///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "searches"];
hp = MKSS_Base_EnemyHP_Attacker;
points = MKSS_Base_EnemyPoints_Attacker;
metaPointsOnHit = MKSS_Base_EnemyMetaPoints_Attacker;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Attacker;
hasKnockback = false;
canGetHurt = false;

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion
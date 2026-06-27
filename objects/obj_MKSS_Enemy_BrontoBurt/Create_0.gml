///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "brontoBurt"];
hp = MKSS_Base_EnemyHP_Fodder;
points = MKSS_Base_EnemyPoints_Fodder;
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Fodder;
metaPointsOnOverkill = floor(metaPointsOnDeath / 2);
knockbackResistance = .8;

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion
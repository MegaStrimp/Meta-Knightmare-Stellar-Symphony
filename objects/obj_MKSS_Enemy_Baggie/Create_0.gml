///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "baggie"];
hp = MKSS_Base_EnemyHP_Fodder * 3;
points = MKSS_Base_EnemyPoints_Fodder * 5;
metaPointsOnHit = floor(MKSS_Base_EnemyPoints_Fodder / 5);
metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Fodder * 5;
metaPointsOnOverkill = floor(metaPointsOnDeath / 2);

hitParticleIndex = scr_MKSS_ParticleSet_BaggieCoins;

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion
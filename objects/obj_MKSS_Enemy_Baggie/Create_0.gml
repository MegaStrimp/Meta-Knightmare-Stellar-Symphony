///@description Create

#region Event Inherited
event_inherited();
#endregion

#region AI Scripts
enemyGetHitObject = scr_MKSS_Enemy_GetHit_Object;
enemyWallXCollision = scr_MKSS_Enemy_WallXCollision;
enemyWallYCollision = scr_MKSS_Enemy_WallYCollision;
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "baggie"];
hp = 12;
points = 500;
metaPointsOnHit = 2;
metaPointsOnDeath = 25;
metaPointsOnOverkill = 10;

hitParticleIndex = scr_MKSS_ParticleSet_BaggieCoins;
deathParticleIndex = scr_MKSS_ParticleSet_EnemyDefeatStars;

freezeFrameForce = 2;
#endregion

#region Sprites
spriteSet = global.MKSS_EnemyList[enemyID].spriteSet;
sprHurt = spriteSet.sprHurtList;
mask_index = spriteSet.maskIndex;
#endregion

#region AI Scripts
enemyBeginStep = scr_MKSS_Enemy_BeginStep_Normal;
enemyStep = scr_MKSS_Enemy_Step_Normal;
#endregion
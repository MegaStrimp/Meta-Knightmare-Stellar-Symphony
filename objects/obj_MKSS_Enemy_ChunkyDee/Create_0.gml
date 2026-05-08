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
enemyID = global.MKSS_EnemyIDs[? "chunkyDee"];
hp = 150;
points = 2500;
metaPointsOnDeath = 25;
metaPointsOnOverkill = 30;
isBoss = true;
canHaveKnockback = false;

//hitParticleIndex = scr_MKSS_ParticleSet_StarBlockBreak; STRIMPTODO
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
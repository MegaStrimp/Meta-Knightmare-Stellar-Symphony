///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "starlessMarx"];
hp = 1000;
points = 5000;
isBoss = true;

//hitParticleIndex = scr_MKSS_ParticleSet_StarBlockBreak; STRIMPTODO
deathParticleIndex = scr_MKSS_ParticleSet_EnemyDefeatStars;

canHaveKnockback = false;

freezeFrameForce = 2;
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
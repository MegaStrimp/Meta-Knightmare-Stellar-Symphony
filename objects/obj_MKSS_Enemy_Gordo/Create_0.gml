///@description Create

#region Event Inherited
event_inherited();
#endregion

#region AI Scripts
enemyGetHitObject = scr_MKSS_Enemy_GetHit_Object;
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "gordo"];

canBreakLightInvincibility = true;
canBeHurt = false;
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
///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Gameplay Variables
enemyID = global.MKSS_EnemyIDs[? "starlessNightmare"];
hp = 99999999999;
points = 5000;

deathTimerMax = 0;
//hitParticleIndex = scr_DL1_ParticleSet_EnemyDefeatStars;
deathParticleIndex = -1;

canHaveKnockback = false;
#endregion
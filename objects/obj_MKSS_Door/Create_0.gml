///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Initialize Variables
#region Gameplay Variables
text = "";

bigStarSprite = spr_MKSS_Particle_BigStar_Yellow;
bigStarSpeed = sprite_get_speed(bigStarSprite) / 60;
bigStarIndex = 0;
bigStarNumber = sprite_get_number(bigStarSprite);

particleDir = 1;
particleTimerMax = 15;
particleTimer = particleTimerMax;

doorStarParticleSet = scr_MKSS_ParticleSet_DoorStar_Yellow1;

hasButtonHint = false;
#endregion
#endregion
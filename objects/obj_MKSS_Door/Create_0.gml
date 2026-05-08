///@description Create

#region Event Inherited
event_inherited();
#endregion

#region Initialize Variables
#region Gameplay Variables
text = "";

bigStarSpeed = sprite_get_speed(spr_MKSS_Particle_BigStar_Yellow) / 60;
bigStarIndex = 0;
bigStarNumber = sprite_get_number(spr_MKSS_Particle_BigStar_Yellow);

particleDir = 1;
particleTimerMax = 15;
particleTimer = particleTimerMax;
#endregion
#endregion
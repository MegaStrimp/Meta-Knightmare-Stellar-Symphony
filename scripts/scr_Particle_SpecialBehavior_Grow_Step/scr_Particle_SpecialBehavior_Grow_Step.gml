///@description Particle - Special Behavior - Grow - Step

function scr_Particle_SpecialBehavior_Grow_Step()
{
	scale = min(scale + (scaleSpd * speedMultFinal),scaleTarget);
}
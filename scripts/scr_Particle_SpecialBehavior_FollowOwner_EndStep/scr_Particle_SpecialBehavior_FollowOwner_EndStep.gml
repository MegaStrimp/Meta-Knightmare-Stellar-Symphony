///@description Particle - Special Behavior - Follow Owner - End Step

function scr_Particle_SpecialBehavior_FollowOwner_EndStep()
{
	if (instance_exists(owner))
	{
		x = owner.x;
		y = owner.y;
	}
}
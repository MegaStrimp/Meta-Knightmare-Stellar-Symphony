///@description MKSS - Particle - Special Behavior - Marx Cannon - Step

function scr_MKSS_Particle_SpecialBehavior_MarxCannon_Step()
{
	if (instance_exists(owner))
	{
		if (owner.parried)
		{
			if ((owner.owner.dirX == -1) and (x <= obj_Player.x + 16)) or ((owner.owner.dirX == 1) and (x >= obj_Player.x - 16))
			{
				vsp = random_range(9,12) * choose(-1,1);
			}
		}
	}
}
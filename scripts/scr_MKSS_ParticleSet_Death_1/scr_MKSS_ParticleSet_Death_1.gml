///@description MKSS - Particle Set - Death

function scr_MKSS_ParticleSet_Death(parTargetX,parTargetY)
{
	for (var i = 0; i < 8; i++)
	{
		var targetAngle = ((8 - i) * (360 / 8));
		
		par[i] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
		par[i].sprite_index = spr_MKSS_Particle_ShrinkingStar3;
		par[i].particleAfterDeath[0] = scr_MKSS_ParticleSet_SmallSparkle_NoPause;
		par[i].destroyAfterAnimation = true;
		par[i].hsp = lengthdir_x(2,targetAngle);
		par[i].vsp = lengthdir_y(2,targetAngle);
		par[i].canBePaused = false;
	};
	
	return par;
}
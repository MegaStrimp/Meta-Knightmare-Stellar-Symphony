///@description MKSS - Particle Set - Fall Duck

function scr_MKSS_ParticleSet_FallDuck(parTargetX,parTargetY,parTargetDirX,parTargetAngle)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_SmallStar;
	par[0].particleAfterDeath[0] = scr_MKSS_ParticleSet_SmallSparkle;
	par[0].destroyTimer = 15;
	par[0].hsp = lengthdir_x(5,parTargetAngle);
	par[0].vsp = lengthdir_y(5,parTargetAngle);
	par[0].decelX = .4;
	par[0].decelY = .4;
	
	return par;
}
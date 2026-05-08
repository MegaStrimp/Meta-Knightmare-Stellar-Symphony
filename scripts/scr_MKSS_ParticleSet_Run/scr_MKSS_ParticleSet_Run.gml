///@description MKSS - Particle Set - Run

function scr_MKSS_ParticleSet_Run(parTargetX,parTargetY,parTargetDirX)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Run;
	par[0].hsp = (1.25 + random_range(-.75,.75)) * -parTargetDirX;
	par[0].vsp = -(2 + random_range(-.75,.75));
	par[0].destroyAfterAnimation = true;
	par[0].dirX = -parTargetDirX;
	
	return par;
}
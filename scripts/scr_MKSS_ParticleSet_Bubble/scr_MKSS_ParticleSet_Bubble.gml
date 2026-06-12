///@description MKSS - Particle Set - Bubble

function scr_MKSS_ParticleSet_Bubble(parTargetX,parTargetY,parTargetDirX)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Bubble;
	par[0].hsp = ((.5*parTargetDirX) + random_range(-.5,.5));
	par[0].vsp = -.25;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
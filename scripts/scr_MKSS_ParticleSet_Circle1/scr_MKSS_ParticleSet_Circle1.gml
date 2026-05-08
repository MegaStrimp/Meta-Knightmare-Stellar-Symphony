///@description MKSS - Particle Set - Circle

function scr_MKSS_ParticleSet_Circle1(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Circle1;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
///@description MKSS - Particle Set - Explosion 2

function scr_MKSS_ParticleSet_Explosion2(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Explosion2;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
///@description MKSS - Particle Set - Explosion 3

function scr_MKSS_ParticleSet_Explosion3(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Explosion3;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
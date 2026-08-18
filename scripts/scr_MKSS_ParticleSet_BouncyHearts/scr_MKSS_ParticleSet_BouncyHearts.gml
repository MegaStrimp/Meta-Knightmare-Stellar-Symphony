///@description MKSS - Particle Set - Bouncy Hearts

function scr_MKSS_ParticleSet_BouncyHearts(parTargetX,parTargetY,parTargetDepth)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,parTargetDepth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_BouncyHearts;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
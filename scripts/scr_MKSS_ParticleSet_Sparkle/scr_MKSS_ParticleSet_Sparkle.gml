///@description MKSS - Particle Set - Sparkle

function scr_MKSS_ParticleSet_Sparkle(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Sparkle;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
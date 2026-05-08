///@description MKSS - Particle Set - Impact

function scr_MKSS_ParticleSet_Impact(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX + irandom_range(-6,6),parTargetY + irandom_range(-6,6),depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Impact1;
	par[0].image_angle = irandom_range(0,359);
	par[0].destroyAfterAnimation = true;
	
	return par;
}
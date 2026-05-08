///@description MKSS - Particle Set - Slash Random

function scr_MKSS_ParticleSet_SlashRandom(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX + irandom_range(-6,6),parTargetY + irandom_range(-6,6),depth - 1,obj_Particle);
	par[0].sprite_index = choose(spr_MKSS_Particle_Slash1,spr_MKSS_Particle_Slash2);
	par[0].image_angle = irandom_range(0,359);
	par[0].destroyAfterAnimation = true;
	
	return par;
}
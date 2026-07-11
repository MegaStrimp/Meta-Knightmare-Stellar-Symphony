///@description MKSS - Particle Set - Special Sparkle

function scr_MKSS_ParticleSet_SpecialSparkle(parTargetX,parTargetY,parTargetSprite = spr_MKSS_Particle_SpecialSparkle_Yellow)
{
	par[0] = instance_create_depth(parTargetX + irandom_range(-8,8),parTargetY + irandom_range(-8,8),depth - 1,obj_Particle);
	par[0].sprite_index = parTargetSprite;
	par[0].image_index = choose(0,1);
	par[0].vsp = random_range(-2,-1);
	par[0].destroyAfterAnimation = true;
	
	return par;
}
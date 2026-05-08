///@description MKSS - Particle Set - Dust

function scr_MKSS_ParticleSet_Dust(parTargetX,parTargetY,parTargetDepth,parPalSprite)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,parTargetDepth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Dust;
	par[0].image_index = irandom(1);
	par[0].hsp = random_range(-3,-1);
	par[0].vsp = random_range(-.5,.5);
	par[0].destroyAfterAnimation = true;
	par[0].palSprite = parPalSprite;
	par[0].palIndex = 1;
	
	return par;
}
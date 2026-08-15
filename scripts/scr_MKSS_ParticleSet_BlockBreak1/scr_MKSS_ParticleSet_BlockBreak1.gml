///@description MKSS - Particle Set - Block Break 1

function scr_MKSS_ParticleSet_BlockBreak1(parTargetX = x,parTargetY = y,parTargetDepth = depth)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,parTargetDepth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_BlockBreak1;
	par[0].image_index = random_range(0,2);
	par[0].imageSpeed = random_range(.75,1.25);
	par[0].destroyAfterAnimation = true;
	
	return par;
}
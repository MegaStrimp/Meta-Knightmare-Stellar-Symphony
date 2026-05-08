///@description MKSS - Particle Set - Parriable

function scr_MKSS_ParticleSet_Parriable(parTargetX,parTargetY)
{
	var pieceCount = irandom_range(1,2);
	
	for (var i = 0; i < pieceCount; i++)
	{
		par[i] = instance_create_depth(parTargetX + irandom_range(-8,8),parTargetY + irandom_range(-8,8),depth - 1,obj_Particle);
		par[i].sprite_index = spr_MKSS_Particle_CrossStar2;
		par[i].image_index = random_range(0,par[i].image_number - 1);
		par[i].vsp = -1;
		par[i].destroyAfterAnimation = true;
	}
	
	return par;
}
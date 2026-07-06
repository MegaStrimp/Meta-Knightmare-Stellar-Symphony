///@description MKSS - Particle Set - Parry Circle

function scr_MKSS_ParticleSet_ParryCircle(parTargetX,parTargetY,targetIsEnemy = false)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	if (targetIsEnemy)
	{
		par[0].sprite_index = spr_MKSS_Particle_ParryCircle;
	}
	else
	{
		par[0].sprite_index = spr_MKSS_Particle_ParryCircle;
	}
	par[0].canBePaused = false;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
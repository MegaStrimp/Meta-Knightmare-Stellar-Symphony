///@description MKSS - Particle Set - Player Hit

function scr_MKSS_ParticleSet_PlayerHit(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_PlayerHit;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
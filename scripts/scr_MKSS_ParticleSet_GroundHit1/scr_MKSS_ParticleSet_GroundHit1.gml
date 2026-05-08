///@description MKSS - Particle Set - Ground Hit 1

function scr_MKSS_ParticleSet_GroundHit1(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_GroundHit1;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
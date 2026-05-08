///@description MKSS - Particle Set - Spark

function scr_MKSS_ParticleSet_Spark(parTargetX,parTargetY,parDestroyTimer)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Spark;
	par[0].destroyTimer = parDestroyTimer;
	
	return par;
}
///@description MKSS - Particle Set - Enemy Spawn

function scr_MKSS_ParticleSet_EnemySpawn(parTargetX,parTargetY,parTargetDestroyTimer)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_MKSS_Particle_EnemySpawn);
	par[0].destroyTimer = parTargetDestroyTimer;
	
	return par;
}
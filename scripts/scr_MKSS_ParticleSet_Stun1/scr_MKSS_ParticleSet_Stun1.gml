///@description MKSS - Particle Set - Stun 1

function scr_MKSS_ParticleSet_Stun1(parTargetDestroyTimer = 60)
{
	par[0] = instance_create_depth(x,y,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Stun1;
	par[0].destroyTimer = parTargetDestroyTimer;
	par[0].owner = id;
	par[0].specialBehavior_EndStep = scr_Particle_SpecialBehavior_FollowOwner_EndStep;
	
	return par;
}
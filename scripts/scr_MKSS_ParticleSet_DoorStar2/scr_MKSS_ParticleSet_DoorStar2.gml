///@description MKSS - Particle Set - Door Star 2

function scr_MKSS_ParticleSet_DoorStar2(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_DoorStar2;
	par[0].destroyTimer = 5;
	
	return par;
}
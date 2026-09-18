///@description MKSS - Particle Set - Door Star - Yellow 2

function scr_MKSS_ParticleSet_DoorStar_Yellow2(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_DoorStar_Yellow;
	par[0].destroyTimer = 5;
	
	return par;
}
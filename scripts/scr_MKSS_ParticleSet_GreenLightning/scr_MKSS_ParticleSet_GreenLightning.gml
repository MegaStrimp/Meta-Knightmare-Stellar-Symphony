///@description MKSS - Particle Set - Green Lightning

function scr_MKSS_ParticleSet_GreenLightning(parTargetX,parTargetY,targetHsp = 0,targetVsp = 0,targetDestroyTimer = 60)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_GreenLightning;
	par[0].hsp = targetHsp;
	par[0].vsp = targetVsp;
	par[0].destroyTimer = targetDestroyTimer;
	
	return par;
}
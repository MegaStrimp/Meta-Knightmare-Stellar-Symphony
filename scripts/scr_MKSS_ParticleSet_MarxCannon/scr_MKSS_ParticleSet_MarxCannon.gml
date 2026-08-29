///@description MKSS - Particle Set - Marx Cannon

function scr_MKSS_ParticleSet_MarxCannon(parTargetX,parTargetY,targetHsp)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 2,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_VineEffect1;
	par[0].image_index = 0;
	par[0].imageSpeed = 0;
	par[0].destroyTimer = 240;
	par[0].hsp = targetHsp;
	
	return par;
}
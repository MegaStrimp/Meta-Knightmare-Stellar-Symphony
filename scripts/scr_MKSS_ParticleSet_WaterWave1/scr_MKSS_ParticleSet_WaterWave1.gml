///@description MKSS - Particle Set - Water Wave 1

function scr_MKSS_ParticleSet_WaterWave1(parTargetX,parTargetY,parTargetDepth)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,parTargetDepth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_WaterWave1;
	par[0].hsp = -2;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
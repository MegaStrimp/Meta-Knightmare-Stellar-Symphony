///@description MKSS - Particle Set - Door Star 1

function scr_MKSS_ParticleSet_DoorStar1(parTargetX,parTargetY,parTargetDir)
{
	par[0] = instance_create_depth(parTargetX + (8 * parTargetDir),parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_DoorStar1;
	par[0].hsp = .27 * parTargetDir;
	par[0].vsp = .75;
	par[0].decelX = .02;
	par[0].dirX = particleDir;
	par[0].destroyTimer = 30;
	par[0].particleAfterDeath[0] = scr_MKSS_ParticleSet_DoorStar2;
	
	return par;
}
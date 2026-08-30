///@description MKSS - Particle Set - Marx Cannon

function scr_MKSS_ParticleSet_MarxCannon(parTargetX,parTargetY,targetHsp,targetOwner)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 2,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_VineEffect1;
	par[0].image_index = 0;
	par[0].imageSpeed = 0;
	par[0].destroyTimer = 240;
	par[0].hsp = targetHsp;
	par[0].owner = targetOwner;
	with (par[0]) scr_MKSS_Particle_SpecialBehavior_MarxCannon_Setup();
	
	return par;
}
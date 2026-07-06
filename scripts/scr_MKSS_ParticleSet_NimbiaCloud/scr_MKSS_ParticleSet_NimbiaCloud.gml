///@description MKSS - Particle Set - Nimbia Cloud

function scr_MKSS_ParticleSet_NimbiaCloud(parTargetX,parTargetY,parTargetHsp = 0,parTargetVsp = 0,parTargetDepth = 1)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + parTargetDepth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_NimbiaCloud;
	par[0].hsp = parTargetHsp;
	par[0].vsp = parTargetVsp;
	par[0].destroyAfterAnimation = true;
	par[0].imageSpeed = random_range(.5,1);
	
	return par;
}
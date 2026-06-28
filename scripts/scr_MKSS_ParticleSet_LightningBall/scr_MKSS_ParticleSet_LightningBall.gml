///@description MKSS - Particle Set - Lightning Ball

function scr_MKSS_ParticleSet_LightningBall(parTargetX,parTargetY,targetHsp = 0,targetVsp = 0)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_LightningBall;
	par[0].hsp = targetHsp;
	par[0].vsp = targetVsp;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
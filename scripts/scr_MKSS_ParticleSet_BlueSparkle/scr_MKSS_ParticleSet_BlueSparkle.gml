///@description MKSS - Particle Set - Blue Sparkle

function scr_MKSS_ParticleSet_BlueSparkle(parTargetX,parTargetY,parTargetHsp = 0,parTargetVsp = 0)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_SpecialSparkle_Blue;
	par[0].destroyAfterAnimation = true;
	par[0].canBePaused = false;
	par[0].hsp = parTargetHsp;
	par[0].vsp = parTargetVsp;
	
	return par;
}
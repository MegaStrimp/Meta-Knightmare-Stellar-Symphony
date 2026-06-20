///@description MKSS - Particle Set - Small Sparkle - No Pause

function scr_MKSS_ParticleSet_SmallSparkle_NoPause(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_SmallSparkle;
	par[0].destroyAfterAnimation = true;
	par[0].canBePaused = false;
	
	return par;
}
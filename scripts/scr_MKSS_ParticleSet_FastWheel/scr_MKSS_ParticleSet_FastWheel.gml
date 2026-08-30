///@description MKSS - Particle Set - Fast Wheel

function scr_MKSS_ParticleSet_FastWheel(parTargetX,parTargetY,parTargetDirX)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_FastWheel;
	par[0].destroyAfterAnimation = true;
	par[0].dirX = parTargetDirX;
	par[0].image_xscale = parTargetDirX;
	par[0].owner = id;
	par[0].specialBehavior_EndStep = scr_Particle_SpecialBehavior_FollowOwner_EndStep;
	
	return par;
}
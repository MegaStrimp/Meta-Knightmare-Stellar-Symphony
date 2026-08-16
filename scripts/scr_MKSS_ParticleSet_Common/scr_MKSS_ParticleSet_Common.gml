///@description MKSS - Particle Set - Common

function scr_MKSS_ParticleSet_Common(parTargetX,parTargetY,targetSprite,targetDepth = 1)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + targetDepth,obj_Particle);
	par[0].sprite_index = targetSprite;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
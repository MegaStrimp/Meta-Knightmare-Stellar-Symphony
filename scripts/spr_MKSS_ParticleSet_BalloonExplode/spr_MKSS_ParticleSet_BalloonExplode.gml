///@description MkSS - Particle Set - Balloon Explode

function spr_MKSS_ParticleSet_BalloonExplode(parTargetX,parTargetY,parTargetExplodeSprite,parTargetPalSprite,parTargetPalIndex)
{
	var par = [];
	
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	with (par[0])
	{
		sprite_index = parTargetExplodeSprite;
		palSprite = parTargetPalSprite;
		palIndex = parTargetPalIndex;
		destroyAfterAnimation = true;
	}
	
	par[1] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	with (par[1])
	{
		sprite_index = spr_MKSS_Particle_BalloonExplode_Impact;
		palSprite = parTargetPalSprite;
		palIndex = parTargetPalIndex;
		destroyAfterAnimation = true;
	}
	
	return par;
}
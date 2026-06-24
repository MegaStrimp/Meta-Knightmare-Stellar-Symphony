///@description MKSS - Particle Set - Afterimage

function scr_MKSS_ParticleSet_Afterimage(parTargetX = x,parTargetY = y,parTargetHsp = 0,parTargetVsp = 0,parTargetScale = scale,parTargetDirX = dirX,parTargetDirY = dirY,parTargetPalSprite = palSprite,parTargetPalIndex = palIndex)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = sprite_index;
	par[0].image_index = image_index;
	par[0].imageSpeed = 0;
	par[0].image_alpha = .25;
	par[0].destroyTimer = 5;
	par[0].hsp = parTargetHsp;
	par[0].vsp = parTargetVsp;
	par[0].scale = parTargetScale;
	par[0].dirX = parTargetDirX;
	par[0].dirY = parTargetDirY;
	par[0].image_xscale = par[0].scale * par[0].dirX;
	par[0].image_yscale = par[0].scale * par[0].dirY;
	par[0].palSprite = parTargetPalSprite;
	par[0].palIndex = parTargetPalIndex;
	par[0].palIndex = parTargetPalIndex;
	par[0].palIndex = parTargetPalIndex;
	
	return par;
}
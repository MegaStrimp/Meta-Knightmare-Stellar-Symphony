///@description MKSS - Particle Set - Concentrated Gem Break

function scr_MKSS_ParticleSet_ConcentratedGemBreak(parTargetX,parTargetY,parPalSprite)
{
	par[0] = instance_create_depth(parTargetX + irandom_range(-16,16),parTargetY + irandom_range(-16,16),depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_CrossStar3;
	par[0].destroyAfterAnimation = true;
	
	var pieceCount = irandom_range(1,4);
	
	for (var i = 0; i < pieceCount; i++)
	{
		par[i + 1] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
		par[i + 1].sprite_index = spr_MKSS_Particle_ConcentratedGemShard;
		par[i + 1].image_index = random_range(0,3);
		par[i + 1].hsp = random_range(-2,2);
		par[i + 1].vsp = random_range(-3,1);
		par[i + 1].grav = .15;
		par[i + 1].gravLimit = 2;
		par[i + 1].destroyTimer = irandom_range(15,30);
		par[i + 1].rotateTimerMax = random_range(2,6);
		par[i + 1].rotateTimer = par[i + 1].rotateTimerMax;
		par[i + 1].rotateSpd = 45;
		par[i + 1].palSprite = parPalSprite;
		par[i + 1].particleAfterDeath[0] = scr_MKSS_ParticleSet_SmallSparkle;
	}
	
	return par;
}
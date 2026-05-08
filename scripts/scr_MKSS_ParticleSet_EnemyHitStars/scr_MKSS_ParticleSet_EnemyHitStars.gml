///@description MKSS - Particle Set - Enemy Hit Stars

function scr_MKSS_ParticleSet_EnemyHitStars(parTargetX,parTargetY,parIsOverkill)
{
	var pieceCount = irandom_range(2,3);
	
	for (var i = 0; i < pieceCount; i++)
	{
		var angle = irandom_range(0,359);
		var rainbowRng = irandom_range(1,sprite_get_width(spr_MKSS_Particle_Star_Pal_Blue) - 1);
		
		par[i] = instance_create_depth(parTargetX + irandom_range(-4,4),parTargetY + irandom_range(-4,4),depth,obj_Particle);
		if (parIsOverkill)
		{
			par[i].sprite_index = spr_MKSS_Particle_ShrinkingStar1;
		}
		else
		{
			par[i].sprite_index = spr_MKSS_Particle_ShrinkingStar2;
		}
		par[i].hsp = lengthdir_x(3,angle);
		par[i].vsp = lengthdir_y(3,angle);
		par[i].grav = .15;
		par[i].gravLimit = 2;
		par[i].destroyAfterAnimation = true;
		par[i].particleAfterDeath[0] = scr_MKSS_ParticleSet_SmallSparkle;
		par[i].palSprite = spr_MKSS_Particle_Star_Pal_Blue;
		par[i].palIndex = rainbowRng;
	}
	
	return par;
}
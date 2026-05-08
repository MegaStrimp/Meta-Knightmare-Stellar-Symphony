///@description MKSS - Particle Set - Baggie Coins

function scr_MKSS_ParticleSet_BaggieCoins(parTargetX,parTargetY)
{
	var pieceCount = irandom_range(1,2);
	
	for (var i = 0; i < pieceCount; i++)
	{
		var angle = irandom_range(105,75);
		
		par[i] = instance_create_depth(parTargetX + irandom_range(-4,4),parTargetY + irandom_range(-4,4),depth - choose(0,1),obj_Particle);
		par[i].sprite_index = spr_MKSS_Particle_BaggieCoins;
		par[i].image_index = random_range(0,par[i].image_number - 1);
		par[i].hsp = lengthdir_x(2,angle);
		par[i].vsp = lengthdir_y(2.5,angle);
		par[i].grav = .15;
		par[i].gravLimit = 2;
		par[i].destroyTimer = irandom_range(20,45);
		par[i].particleAfterDeath[0] = scr_MKSS_ParticleSet_SmallSparkle;
	}
	
	return par;
}
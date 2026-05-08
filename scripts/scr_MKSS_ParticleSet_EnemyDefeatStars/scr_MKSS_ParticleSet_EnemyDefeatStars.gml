///@description MKSS - Particle Set - Enemy Defeat Stars

function scr_MKSS_ParticleSet_EnemyDefeatStars(parTargetX,parTargetY)
{
	var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Circle1;
	par[0].destroyAfterAnimation = true;
	
	var pieceCount = irandom_range(3,6);
	var rainbowRng = irandom_range(1,sprite_get_width(spr_MKSS_Particle_Star_Pal) - 1);
	
	for (var i = 0; i < pieceCount; i++)
	{
		par[i + 1] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
		par[i + 1].sprite_index = spr_MKSS_Particle_StarSplash1;
		par[i + 1].hsp = lengthdir_x(random_range(1.5,2),i * (360 / pieceCount));
		par[i + 1].vsp = lengthdir_y(random_range(1.5,2),i * (360 / pieceCount));
		par[i + 1].destroyAfterAnimation = true;
		par[i + 1].rotateTimerMax = random_range(5,9);
		par[i + 1].rotateTimer = par[i + 1].rotateTimerMax;
		par[i + 1].rotateSpd = 45;
		par[i + 1].palSprite = spr_MKSS_Particle_Star_Pal;
		par[i + 1].palIndex = rainbowRng;
	}
	
	return par;
}
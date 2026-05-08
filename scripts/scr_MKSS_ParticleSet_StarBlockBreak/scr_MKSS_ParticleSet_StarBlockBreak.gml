///@description MKSS - Particle Set - Star Block Break

function scr_MKSS_ParticleSet_StarBlockBreak(parTargetX,parTargetY)
{
	var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_BlockBreak1;
	par[0].image_index = random_range(0,2);
	par[0].imageSpeed = random_range(.75,1.25);
	par[0].destroyAfterAnimation = true;
	
	var pieceCount = irandom_range(0,2);
	
	for (var i = 0; i < pieceCount; i++)
	{
		par[i + 1] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
		par[i + 1].sprite_index = spr_MKSS_Particle_BlockPiece;
		par[i + 1].image_index = random_range(0,1);
		par[i + 1].hsp = random_range(-2,2);
		par[i + 1].vsp = random_range(-3,1);
		par[i + 1].grav = .15;
		par[i + 1].gravLimit = 2;
		par[i + 1].destroyAfterAnimation = true;
		par[i + 1].rotateTimerMax = random_range(2,6);
		par[i + 1].rotateTimer = par[i + 1].rotateTimerMax;
		par[i + 1].rotateSpd = 45;
		par[i + 1].palSprite = palSprite;
		par[i + 1].palIndex = palIndex;
	}
	
	return par;
}
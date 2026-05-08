///@description MKSS - Particle Set - Wall Hit

function scr_MKSS_ParticleSet_WallHit(parTargetX,parTargetY)
{
	var sfx = scr_PlaySfx(snd_MKSS_BlockBreak);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Impact1;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
///@description MKSS - Particle Set - Meta Point Collect

function scr_MKSS_ParticleSet_MetaPointCollect(parTargetX,parTargetY,parSize)
{
	var snd = snd_MKSS_MetaPointCollect1;
	switch (parSize)
	{
		case 1:
		snd = snd_MKSS_MetaPointCollect2;
		break;
		
		case 2:
		snd = snd_MKSS_MetaPointCollect3;
		break;
	}
	var sfx = scr_PlaySfx(snd);
	audio_sound_pitch(sfx,random_range(.95,1.05));
	
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_SmallSparkle;
	if (parSize == 1) par[0].sprite_index = spr_MKSS_Particle_Sparkle;
	if (parSize == 1) par[0].sprite_index = spr_MKSS_Particle_MetaPointCollect;
	if (parSize == 2) par[0].sprite_index = spr_MKSS_Particle_MetaPointCollect;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
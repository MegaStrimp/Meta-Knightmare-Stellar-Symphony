///@description MKSS - Particle Set - Meta Point Trail

function scr_MKSS_ParticleSet_MetaPointTrail(parTargetX,parTargetY,parSize)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_MetaPointTrail1;
	if (parSize == 1) par[0].sprite_index = spr_MKSS_MetaPointTrail2;
	if (parSize == 2) par[0].sprite_index = spr_MKSS_MetaPointTrail3;
	par[0].destroyAfterAnimation = true;
	
	return par;
}
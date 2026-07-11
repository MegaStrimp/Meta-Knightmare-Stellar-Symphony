///@description MKSS - Particle Set - Meta Heal

function scr_MKSS_ParticleSet_MetaHeal(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_MetaHeal_Front;
	par[0].hsp = hsp;
	par[0].vsp = -2;
	par[0].destroyAfterAnimation = true;
	
	par[1] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[1].sprite_index = spr_MKSS_Particle_MetaHeal_Back;
	par[1].hsp = hsp;
	par[1].vsp = -2;
	par[1].destroyAfterAnimation = true;
	
	return par;
}
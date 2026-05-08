///@description MKSS - Particle Set - Parry Ghost

function scr_MKSS_ParticleSet_ParryGhost(parTargetX,parTargetY,parTargetDir,parTargetSprite,parTargetPal = -1)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth,obj_Particle);
	par[0].sprite_index = spr_MKSS_Player_MetaKnight_Normal_Base_Parry;
	par[0].image_alpha = .35;
	par[0].owner = id;
	par[0].palSprite = spr_MKSS_SprayPaint_Misc_ParryCooldown;
	par[0].scaleSpd = .2;
	par[0].scaleTarget = 1.5;
	par[0].dirX = parTargetDir;
	par[0].destroyTimer = 30;
	par[0].specialBehavior_Step = scr_Particle_SpecialBehavior_Grow_Step;
	par[0].specialBehavior_EndStep = scr_Particle_SpecialBehavior_FollowOwner_EndStep;
	
	return par;
}
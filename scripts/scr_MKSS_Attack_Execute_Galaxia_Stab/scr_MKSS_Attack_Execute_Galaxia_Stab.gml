///@description MKSS - Attack - Execute - Galaxia - Stab

function scr_MKSS_Attack_Execute_Galaxia_Stab()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slide);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Particles
	scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	hasAttackAnimation = false;
	scr_ChangeSprite(spriteSet.sprAttackGalaxiaStab);
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Galaxia_Stab_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	canAttackCancelTargetState = false;
	
	hsp = galaxia_Stab_Movespeed * dirX * speedMultFinal;
	drawDirX = dirX;
	
	attackCancelTimer = 30;
	attackCooldownTarget = 0;
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = 2;
		followOwner = true;
		followOwnerImageIndex = true;
		destroyIfOwnerNotAttack = true;
		canBreakBlocks = true;
		isMelee = true;
		freezeFrameForce = 1;
		knockbackAngle = 10;
		if (other.dirX == -1) knockbackAngle = 170;
		knockbackForce = 1;
		sprite_index = spr_MKSS_Player_MetaKnight_Normal_Effects_Attack_Galaxia_Stab;
		mask_index = spr_MKSS_Attack_Galaxia_Stab_Mask;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Galaxia_Stab_BeginStep;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
}
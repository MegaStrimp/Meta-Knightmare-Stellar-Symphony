///@description MKSS - Attack - Execute - Galaxia - Mach Tornado

function scr_MKSS_Attack_Execute_Galaxia_MachTornado()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slide);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Galaxia_MachTornado_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	canAttackCancelTargetState = false;
	
	grounded = false;
	hasJumpLimit = false;
	vsp = -(galaxia_MachTornado_Jumpspeed * speedMultFinal);
	
	attackCancelTimer = 30;
	attackCooldownSpecial = 60;
	#endregion
	
	#region Starting Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = floor(MKSS_Base_GalaxiaDamage / 4);
		followOwner = true;
		canBreakBlocks = true;
		isMelee = true;
		destroyTimer = 5;
		freezeFrameForce = 1;
		mask_index = spr_64x64Mask_MiddleOrigin;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = floor(MKSS_Base_GalaxiaDamage / 4);
		followOwner = true;
		destroyIfOwnerNotAttack = true;
		canBreakBlocks = true;
		isMelee = true;
		isMultiHit = true;
		multiHitTimerMax = 5;
		multiHitTimer = 0;
		freezeFrameForce = 3;
		knockbackForce = 2;
		sprite_index = spr_MKSS_Player_MetaKnight_Normal_Effects_Attack_Galaxia_MachTornado;
		mask_index = spr_48x48Mask_MiddleOrigin;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Galaxia_MachTornado_BeginStep;
		enemyKnockbackBehavior = scr_MKSS_Attack_Galaxia_MachTornado_EnemyKnockbackBehavior;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
}
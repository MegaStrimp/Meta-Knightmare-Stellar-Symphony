///@description MKSS - Attack - Execute - Buzzcut - Finisher

function scr_MKSS_Attack_Execute_Buzzcut_Finisher(hasGigatorque = false)
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slide);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	hasAttackAnimation = false;
	scr_ChangeSprite(spriteSet.sprAttackGalaxiaCircleSlash);
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Buzzcut_Finisher_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	canAttackCancelTargetState = false;
	
	attackStopSpeedLimit = true;
	hsp = buzzcut_Finisher_Movespeed * dirX * speedMultFinal;
	
	attackCancelTimer = 45;
	attackCooldownTarget = 0;
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = floor(MKSS_Base_BuzzcutDamage / 2.5);
		bonusValue = MKSS_Base_AttackBonusValue;
		followOwner = true;
		followOwnerImageIndex = true;
		destroyIfOwnerNotAttack = true;
		canBreakBlocks = true;
		isMelee = true;
		isMultiHit = true;
		multiHitTimerMax = 4 - (hasGigatorque * 2);
		multiHitTimer = 0;
		enemyHurtTimerMult = 3;
		freezeFrameForce = 1;
		knockbackAngle = 45;
		if (other.dirX == -1) knockbackAngle = 135;
		knockbackForce = 1;
		sprite_index = spr_MKSS_Attack_Buzzcut_Finisher_Mask;
		mask_index = spr_MKSS_Attack_Buzzcut_Finisher_Mask;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Buzzcut_Finisher_BeginStep;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
}
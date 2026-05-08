///@description MKSS - Attack - Execute - Buzzcut - Finisher

function scr_MKSS_Attack_Execute_Buzzcut_Finisher()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slash1);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	hasAttackAnimation = false;
	scr_ChangeSprite(spriteSet.sprAttackBuzzcutSlash1);
	hasAttackAnimation = true;
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	
	drawDirX = dirX;
	
	attackCancelTimer = 60;
	attackCooldownTarget = 15;
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
		pauseAfterAnimation = true;
		canBreakBlocks = true;
		isMelee = true;
		isMultiHit = true;
		multiHitTimerMax = 2;
		multiHitTimer = 0;
		enemyHurtTimerMult = 3;
		freezeFrameForce = 1;
		knockbackAngle = 10;
		if (other.dirX == -1) knockbackAngle = 170;
		knockbackForce = 1;
		sprite_index = spr_MKSS_Player_MetaKnight_Normal_Effects_Attack_Buzzcut_Slash1;
		mask_index = spr_MKSS_Player_MetaKnight_Normal_AttackMasks_Attack_Normal_Slash1;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Buzzcut_Finisher_BeginStep;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
}
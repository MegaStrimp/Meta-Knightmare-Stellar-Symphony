///@description MKSS - Attack - Execute - Galaxia - Finisher

function scr_MKSS_Attack_Execute_Galaxia_Finisher()
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
	scr_ChangeSprite(spriteSet.sprAttackGalaxiaSlash1);
	hasAttackAnimation = true;
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	
	drawDirX = dirX;
	
	grounded = false;
	hasJumpLimit = false;
	vsp = -((jumpspeed / 2) * speedMultFinal);
	
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
		canBeFinisher = true;
		freezeFrameForce = 3;
		knockbackAngle = 45;
		if (other.dirX == -1) knockbackAngle = 135;
		knockbackForce = 2;
		sprite_index = spr_MKSS_Player_MetaKnight_Normal_Effects_Attack_Galaxia_Slash2;
		mask_index = spr_MKSS_Player_MetaKnight_Normal_AttackMasks_Attack_Normal_Slash2;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Galaxia_Finisher_BeginStep;
		enemyHitBehavior = scr_MKSS_Attack_Galaxia_Finisher_EnemyHitBehavior;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
}
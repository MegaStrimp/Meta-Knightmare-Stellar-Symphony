///@description MKSS - Attack - Execute - Galaxia - Up Thrust

function scr_MKSS_Attack_Execute_Galaxia_UpThrust()
{
	attackString = global.MKSS_AttackList[attackIndex].ID;
	scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
	
	#region Audio
	var sfx = scr_PlaySfx(snd_MKSS_Slash1);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	#endregion
	
	#region Owner Variables
	isAttacking = true;
	
	scr_ChangeSprite(spriteSet.sprAttackGalaxiaUpAttack,true);
	hasAttackAnimation = true;
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	attackStopMovement = true;
	
	drawDirX = dirX;
	
	attackCancelTimer = 20;
	attackCooldownTarget = 15;
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = 3;
		followOwner = true;
		followOwnerImageIndex = true;
		destroyIfOwnerNotAttack = true;
		pauseAfterAnimation = true;
		canBreakBlocks = true;
		canBeFinisher = true;
		isMelee = true;
		freezeFrameForce = 2;
		knockbackAngle = 90;
		knockbackForce = 2;
		sprite_index = spr_MKSS_Attack_Galaxia_UpThrust_Effect;
		mask_index = spr_MKSS_Attack_Galaxia_UpThrust_Mask;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Galaxia_UpThrust_BeginStep;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
}
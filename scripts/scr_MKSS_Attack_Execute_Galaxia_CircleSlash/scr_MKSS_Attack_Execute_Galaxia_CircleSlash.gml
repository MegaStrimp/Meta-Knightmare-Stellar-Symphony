///@description MKSS - Attack - Execute - Galaxia - Circle Slash

function scr_MKSS_Attack_Execute_Galaxia_CircleSlash()
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
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Galaxia_CircleSlash_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	canAttackCancelTargetState = false;
	
	attackStopSpeedLimit = true;
	hsp = galaxia_CircleSlash_Movespeed * dirX * speedMultFinal;
	
	grounded = false;
	hasJumpLimit = false;
	vsp = -(jumpspeed * speedMultFinal);
	
	attackCancelTimer = 300;
	attackCooldownTarget = 0;
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = floor(MKSS_Base_GalaxiaDamage / 2);
		followOwner = true;
		destroyIfOwnerNotAttack = true;
		canBreakBlocks = true;
		isMelee = true;
		freezeFrameForce = 1;
		knockbackAngle = 45;
		if (other.dirX == -1) knockbackAngle = 135;
		knockbackForce = 1;
		mask_index = spr_48x48Mask_MiddleOrigin;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Galaxia_CircleSlash_BeginStep;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
	}
	#endregion
}
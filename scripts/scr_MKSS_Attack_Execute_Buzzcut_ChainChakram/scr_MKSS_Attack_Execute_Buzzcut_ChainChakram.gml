///@description MKSS - Attack - Execute - Buzzcut - Chain Chakram

function scr_MKSS_Attack_Execute_Buzzcut_ChainChakram()
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
	scr_ChangeSprite(spriteSet.sprAttackBuzzcutSlash1);
	hasAttackAnimation = true;
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	
	drawDirX = dirX;
	
	attackCancelTimer = 15;
	attackCooldownTarget = 15;
	
	isAttacking = true;
	#endregion
	
	#region Attack
	var targetAngle = (((45 - (90 * dirX)) + 360) % 360);
	
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = MKSS_Base_BuzzcutDamage;
		bonusValue = MKSS_Base_AttackBonusValue;
		canBreakBlocks = true;
		isMultiHit = true;
		multiHitTimerMax = 2;
		multiHitTimer = 0;
		enemyHurtTimerMult = 3;
		freezeFrameForce = 1;
		knockbackForce = 1;
		dirX = -1;
		if ((targetAngle == 45) or (targetAngle == 315)) dirX = 1;
		movementAngle = targetAngle - 25;
		knockbackAngle = movementAngle;
		spdMax = 6;
		spd = 4;
		angleDir = 1;
		returnTurn = 5;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_MKSS_Attack_Buzzcut_ChainChakram;
		mask_index = spr_MKSS_Attack_Buzzcut_ChainChakram;
		image_xscale = other.dirX;
		attackAIStep = scr_MKSS_Attack_Buzzcut_ChainChakram_Step;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_SlashRandom;
		decelTimer = 10;
	}
	#endregion
}
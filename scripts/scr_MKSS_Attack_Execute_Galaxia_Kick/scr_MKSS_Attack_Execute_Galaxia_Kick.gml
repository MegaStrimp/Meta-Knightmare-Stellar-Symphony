///@description MKSS - Attack - Execute - Galaxia - Kick

function scr_MKSS_Attack_Execute_Galaxia_Kick()
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
	scr_ChangeSprite(spriteSet.sprAttackKick);
	hasAttackAnimation = true;
	
	scr_MKSS_ParticleSet_Jump(x,y,90 + (75 * dirX));
	
	scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
	
	canCancelAttackAnimation = false;
	attackCanTurnSprite = false;
	
	attackStopSpeedLimit = true;
	hsp = galaxia_Kick_Movespeed * dirX * speedMultFinal;
	drawDirX = dirX;
	
	isRunning = false;
	runBuffer = -1;
	runTurnBuffer = -1;
	runParticleTimer = -1;
	
	attackCancelTimer = 15;
	attackCooldownTarget = 15;
	#endregion
	
	#region Attack
	with (instance_create_depth(x,y,depth - 1,obj_MKSS_Attack))
	{
		owner = other;
		isEnemy = false;
		dmg = 2;
		followOwner = true;
		destroyIfOwnerNotAttack = true;
		canBreakBlocks = true;
		isMelee = true;
		freezeFrameForce = 1;
		knockbackAngle = 10;
		if (other.dirX == -1) knockbackAngle = 170;
		knockbackForce = 1.75;
		mask_index = spr_MKSS_Attack_Galaxia_Kick_Mask;
		image_xscale = other.dirX;
		dirX = other.dirX;
		attackAIBeginStep = scr_MKSS_Attack_Galaxia_Kick_BeginStep;
		enemyHitBehavior = scr_MKSS_Attack_Galaxia_Kick_EnemyHitBehavior;
		attackEnemyHitParticleIndex = scr_MKSS_ParticleSet_Impact;
	}
	#endregion
}
///@description MKSS - Enemy - Wheelie - AI - Walk and Attack - Setup

function scr_MKSS_Enemy_Wheelie_AI_WalkAndAttack_Setup()
{
	#region Component Setup
	scr_Component_WalkAndTurn_Setup(,,-1,-1);
	#endregion
	
	#region Physics Variables
	movespeedBase = 1;
	
	accelBase = .1;
	
	chargeMult = 2.5;
	
	decel = .1;
	
	grav = .2;
	
	gravLimit = 3;
	#endregion
	
	#region Gameplay Variables
	parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryWheelie"];
	
	isTurning = false;
	isCharging = false;
	
	attackState = 0;
	attackTimerMax = 30;
	attackTimer = -1;
	
	revertTimer = -1;
	revertTimerMax = 120;
	
	afterimageTimer = -1;
	afterimageTimerMax = 2;
	#endregion
	
	#region AI Scripts
	enemyAIStepIdle = scr_MKSS_Enemy_Wheelie_AI_WalkAndAttack_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAnimationEnd = scr_MKSS_Enemy_Wheelie_AI_WalkAndAttack_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Wheelie_Palette_Normal;
	#endregion
}
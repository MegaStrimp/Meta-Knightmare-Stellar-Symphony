///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Setup

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_Setup(targetIsBoss = true,targetPlayBossTheme = true)
{
	#region Component Setup
	scr_Component_WalkAndTurn_Setup(,,-1,-1);
	#endregion
	
	#region Physics Variables
	movespeedBase = 1.5;
	
	accelBase = .15;
	
	chargeMult = 2.5;
	
	jumpspeed = 3;
	
	decel = .05;
	decelStun = .15;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	grandWheelie_Attack_FlameTrail = scr_MKSS_Enemy_GrandWheelie_AI_Normal_FlameTrail_Step;
	grandWheelie_Attack_BigRush = scr_MKSS_Enemy_GrandWheelie_AI_Normal_BigRush_Step;
	
	//ds_list_add(attackList,grandWheelie_Attack_FlameTrail);
	ds_list_add(attackList,grandWheelie_Attack_BigRush);
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 20;
	
	isBoss = targetIsBoss;
	playBossTheme = targetPlayBossTheme;
	
	parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryGrandWheelie"];
	
	isTurning = false;
	
	revertTimer = -1;
	revertTimerMax = 120;
	
	afterimageTimer = -1;
	afterimageTimerMax = 2;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	attackStateTimer[16] = -1;
	attackStateTimerMax[16] = -1;
	#endregion
	
	#region AI Scripts
	enemyAICleanUp = scr_MKSS_Enemy_GrandWheelie_AI_Normal_CleanUp;
	enemyAIStepIdle = scr_MKSS_Enemy_GrandWheelie_AI_Normal_Idle_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAIStep = scr_MKSS_Enemy_GrandWheelie_AI_Normal_BigRushIntro_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_GrandWheelie_AI_Normal_AnimationEnd;
	
	stunRevertAI = scr_MKSS_Enemy_GrandWheelie_AI_Normal_Idle_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_GrandWheelie_Palette_Normal;
	#endregion
}
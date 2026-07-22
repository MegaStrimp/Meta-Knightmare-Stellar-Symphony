///@description MKSS - Enemy - Chasse-Emee - AI - Normal - Setup

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_Setup()
{
	#region Physics Variables
	movespeedIntro = 4;
	
	jumpspeed = 3;
	
	decel = .05;
	decelSlash = .5;
	decelIntro = .05;
	decelStun = .15;
	
	grav = .12;
	
	gravLimit = 4;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	#region Attack Scripts
	#region Phase 1
	chasse_Attack_SlashCombo = scr_MKSS_Enemy_ChasseEmee_AI_Normal_SlashCombo_Step;
	#endregion
	#endregion
	
	#region Attack Order
	//ds_list_add(attackList,chasse_Attack_SlashCombo);
	//ds_list_add(attackList,chasse_Attack_SlashCombo);
	//ds_list_add(attackList,chasse_Attack_SlashCombo);
	
	scr_MKSS_Enemy_ChasseEmee_Normal_AttackOrder_Phase1(false);
	if (global.debug) and (keyboard_check(ord("2"))) scr_MKSS_Enemy_ChasseEmee_Normal_AttackOrder_Phase2(true);
	#endregion
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 30;
	
	isBoss = targetIsBoss;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	attackStateTimer[16] = -1;
	attackStateTimerMax[16] = -1;
	#endregion
	
	#region AI Scripts
	enemyAICleanUp = scr_MKSS_Enemy_ChasseEmee_AI_Normal_CleanUp;
	enemyAIStepIdle = scr_MKSS_Enemy_ChasseEmee_AI_Normal_Idle_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAnimationEnd = scr_MKSS_Enemy_ChasseEmee_AI_Normal_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_ChasseEmee_Palette_Normal;
	#endregion
}
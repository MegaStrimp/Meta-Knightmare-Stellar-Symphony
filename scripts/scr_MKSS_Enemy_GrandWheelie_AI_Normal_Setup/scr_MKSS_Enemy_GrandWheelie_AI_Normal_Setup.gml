///@description MKSS - Enemy - Grand Wheelie - AI - Normal - Setup

function scr_MKSS_Enemy_GrandWheelie_AI_Normal_Setup(targetIsBoss = true,targetPlayBossTheme = true)
{
	#region Physics Variables
	jumpspeed = 3;
	
	decel = .05;
	decelStun = .15;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	hasWalked = false;
	
	grandWheelie_Attack_FlameTrail = scr_MKSS_Enemy_GrandWheelie_AI_Normal_FlameTrail_Step;
	grandWheelie_Attack_BigRush = scr_MKSS_Enemy_GrandWheelie_AI_Normal_BigRush_Step;
	
	ds_list_add(attackList,grandWheelie_Attack_FlameTrail);
	ds_list_add(attackList,grandWheelie_Attack_BigRush);
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 20;
	
	isBoss = targetIsBoss;
	playBossTheme = targetPlayBossTheme;
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
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_GrandWheelie_Palette_Normal;
	#endregion
}
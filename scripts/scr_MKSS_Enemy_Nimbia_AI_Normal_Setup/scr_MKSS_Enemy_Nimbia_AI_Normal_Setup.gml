///@description MKSS - Enemy - Nimbia - AI - Normal - Setup

function scr_MKSS_Enemy_Nimbia_AI_Normal_Setup(targetIsBoss = true,targetPlayBossTheme = true)
{
	#region Physics Variables
	jumpspeed = 3;
	
	decel = .05;
	decelSlash = .5;
	decelThrust = 1.5;
	decelStun = .15;
	
	grav = .12;
	
	gravLimit = 4;
	
	arenaLimitLeft = 36;
	arenaLimitRight = room_width-36;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	nimbia_Attack_SlashCombo = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step;
	
	ds_list_add(attackList,nimbia_Attack_SlashCombo);
	
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
	enemyAICleanUp = scr_MKSS_Enemy_Nimbia_AI_Normal_CleanUp;
	enemyAIStepIdle = scr_MKSS_Enemy_Nimbia_AI_Normal_Idle_Step;
	enemyAIStep = enemyAIStepIdle
	enemyAnimationEnd = scr_MKSS_Enemy_Nimbia_AI_Normal_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Nimbia_Palette_Normal;
	#endregion
}
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
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	#region Attack Scripts
	#region Phase 1
	nimbia_Attack_SlashCombo = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step;
	nimbia_Attack_LightningSlash = scr_MKSS_Enemy_Nimbia_AI_Normal_LightningSlash_Step;
	nimbia_Attack_SlashStrike = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashStrike_Step;
	nimbia_Attack_DecoyClouds = scr_MKSS_Enemy_Nimbia_AI_Normal_DecoyClouds_Step;
	nimbia_Attack_TornadoThrowJump = scr_MKSS_Enemy_Nimbia_AI_Normal_TornadoThrowJump_Step;
	nimbia_Attack_TornadoThrow = scr_MKSS_Enemy_Nimbia_AI_Normal_TornadoThrow_Step;
	nimbia_Attack_SummonKracklets = scr_MKSS_Enemy_Nimbia_AI_Normal_SummonKracklets_Step;
	#endregion
	
	#region Phase 2
	nimbia_Attack_KrackoForm = scr_MKSS_Enemy_Nimbia_AI_Normal_KrackoForm_Step;
	nimbia_Attack_SwordForm = scr_MKSS_Enemy_Nimbia_AI_Normal_SwordForm_Step;
	nimbia_Attack_RaijinForm = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step;
	nimbia_Attack_CloneBarrage = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step;
	nimbia_Attack_CloudTraps = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step;
	nimbia_Attack_TornadoAssault = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step;
	#endregion
	#endregion
	
	#region Attack Order
	ds_list_add(attackList,nimbia_Attack_SwordForm);
	//ds_list_add(attackList,nimbia_Attack_SummonKracklets);
	//ds_list_add(attackList,nimbia_Attack_SummonKracklets);
	
	ds_list_add(attackList,nimbia_Attack_SlashCombo);
	ds_list_add(attackList,nimbia_Attack_TornadoThrow);
	ds_list_add(attackList,nimbia_Attack_LightningSlash);
	ds_list_add(attackList,nimbia_Attack_TornadoThrowJump);
	ds_list_add(attackList,nimbia_Attack_SlashStrike);
	ds_list_add(attackList,nimbia_Attack_DecoyClouds);
	ds_list_add(attackList,nimbia_Attack_SummonKracklets);
	#endregion
	
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
	
	krackletLimit = 3;
	krackletAmount = 0;
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
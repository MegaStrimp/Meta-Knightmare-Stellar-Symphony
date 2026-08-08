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
	
	//ds_list_add(attackList,global.MKSS_AttackIDs[? "grandWheelie_SwordThrow"]);
	//ds_list_add(attackList,global.MKSS_AttackIDs[? "grandWheelie_SwordSwing"]);
	//ds_list_add(attackList,global.MKSS_AttackIDs[? "grandWheelie_SwordDash"]);
	//ds_list_add(attackList,global.MKSS_AttackIDs[? "grandWheelie_SwordSlam"]);
	//ds_list_add(attackList,global.MKSS_AttackIDs[? "grandWheelie_ChargeSwing"]);
	
	//grandWheelie_Attack_Walk = scr_MKSS_Enemy_GrandWheelie_AI_Normal_Walk_Step;
	//grandWheelie_Attack_SwordSwing = scr_MKSS_Enemy_GrandWheelie_AI_Normal_SwordSwing_Step;
	//grandWheelie_Attack_SwordDash = scr_MKSS_Enemy_GrandWheelie_AI_Normal_SwordDash_Step;
	//grandWheelie_Attack_SwordSlam = scr_MKSS_Enemy_GrandWheelie_AI_Normal_SwordSlam_Step;
	//grandWheelie_Attack_ChargeSwing = scr_MKSS_Enemy_GrandWheelie_AI_Normal_ChargeSwing_Step;
	//grandWheelie_Attack_SwordThrow = scr_MKSS_Enemy_GrandWheelie_AI_Normal_SwordThrow_Step;
	//grandWheelie_Attack_ShieldRaise = scr_MKSS_Enemy_GrandWheelie_AI_Normal_ShieldRaise_Step;
	
	//ds_list_add(attackList,grandWheelie_Attack_SwordSwing);
	//ds_list_add(attackList,grandWheelie_Attack_SwordDash);
	//ds_list_add(attackList,grandWheelie_Attack_SwordSlam);
	//ds_list_add(attackList,grandWheelie_Attack_SwordThrow);
	//ds_list_add(attackList,grandWheelie_Attack_SwordSwing);
	//ds_list_add(attackList,grandWheelie_Attack_ChargeSwing);
	//ds_list_add(attackList,grandWheelie_Attack_SwordDash);
	//ds_list_add(attackList,grandWheelie_Attack_ShieldRaise);
	//ds_list_add(attackList,grandWheelie_Attack_SwordSlam);
	
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
	
	rangoParryCount = 0;
	rangoParryCountMax = 2;
	#endregion
	
	#region AI Scripts
	//enemyAICleanUp = scr_MKSS_Enemy_GrandWheelie_AI_Normal_CleanUp;
	//enemyAIStepIdle = scr_MKSS_Enemy_GrandWheelie_AI_Normal_Idle_Step
	//enemyAIStep = enemyAIStepIdle
	//enemyAnimationEnd = scr_MKSS_Enemy_GrandWheelie_AI_Normal_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_GrandWheelie_Palette_Normal;
	#endregion
}
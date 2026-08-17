///@description MKSS - Enemy - Starless Marx - AI - Normal - Setup

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Setup(targetIsBoss = true)
{
	#region Physics Variables
	decel = .05;
	decelStun = .25;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	#region Attack Scripts
	marx_Attack_ShooterCutter = scr_MKSS_Enemy_StarlessMarx_AI_Normal_ShooterCutter_Step;
	marx_Attack_IceBomb = scr_MKSS_Enemy_StarlessMarx_AI_Normal_IceBomb_Step;
	marx_Attack_ArrowArrow = scr_MKSS_Enemy_StarlessMarx_AI_Normal_ArrowArrow_Step;
	#endregion
	
	#region Attack Order
	//ds_list_add(attackList,marx_Attack_IceBomb);
	//ds_list_add(attackList,marx_Attack_ShooterCutter);
	//ds_list_add(attackList,marx_Attack_ShooterCutter);
	
	scr_MKSS_Enemy_StarlessMarx_Normal_AttackOrder_Phase1(false);
	if (global.debug) and (keyboard_check(ord("2"))) scr_MKSS_Enemy_StarlessMarx_Normal_AttackOrder_Phase1(true);
	#endregion
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 20;
	
	isBoss = targetIsBoss;
	
	attackTimer = -1;
	attackTimerMax = 90;
	floatOffset = 0;
	
	shooterCutter_Count = 0;
	shooterCutter_CurrentCutterIndex = 0;
	shooterCutter_ParriableCutterIndex = 0;
	shooterCutter_AttackTimer = -1;
	shooterCutter_AttackTimerMax = 60;
	shooterCutter_CancelTimer = -1;
	shooterCutter_CancelTimerMax = 30;
	
	teleport_TargetX = 0;
	teleport_TargetY = 0;
	teleport_TargetState = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step;
	teleport_CanFadeOut = true;
	teleport_RandomCount = 0;
	teleport_TeleportTimer = -1;
	teleport_TeleportTimerMin = 10;
	teleport_TeleportTimerMax = 30;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	attackStateTimer[16] = -1;
	attackStateTimerMax[16] = -1;
	#endregion
	
	#region Sprites
	sprite_index = spriteSet.sprAppear;
	#endregion
	
	#region AI Scripts
	enemyAIStepIdle = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step;
	enemyAIStep = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Appear_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Appear_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_WaddleDee_Palette_Idle; //STRIMPTODO CHANGE
	#endregion
}
///@description MKSS - Enemy - Starless Nightmare - AI - Normal - Setup

function scr_MKSS_Enemy_StarlessNightmare_AI_Normal_Setup(targetIsBoss = true)
{
	#region Physics Variables
	decel = .05;
	decelStun = .25;
	decelFast = .15;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	#region Attack Scripts
	Nightmare_Attack_Teleport = -1;
	#endregion
	
	#region Attack Order
	//scr_MKSS_Enemy_StarlessNightmare_Normal_AttackOrder_Phase1(false);
	//if (global.debug) and (keyboard_check(ord("2"))) scr_MKSS_Enemy_StarlessNightmare_Normal_AttackOrder_Phase1(true);
	#endregion
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 20;
	
	isBoss = targetIsBoss;
	
	attackTimer = -1;
	attackTimerMax = 90;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	attackStateTimer[16] = -1;
	attackStateTimerMax[16] = -1;
	#endregion
	
	#region Sprites
	sprite_index = spriteSet.sprWizardIdle;
	#endregion
	
	#region AI Scripts
	//enemyAIStepIdle = scr_MKSS_Enemy_StarlessNightmare_AI_Normal_Idle_Step;
	//enemyAIStep = scr_MKSS_Enemy_StarlessNightmare_AI_Normal_Appear_Step;
	//enemyAnimationEnd = scr_MKSS_Enemy_StarlessNightmare_AI_Normal_Appear_AnimationEnd;
	
	//stunRevertAI = scr_MKSS_Enemy_StarlessNightmare_AI_Normal_SeedAttack_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_WaddleDee_Palette_Idle; //STRIMPTODO CHANGE
	#endregion
}
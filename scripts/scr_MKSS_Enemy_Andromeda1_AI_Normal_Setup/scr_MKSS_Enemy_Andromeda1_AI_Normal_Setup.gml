///@description MKSS - Enemy - Andromeda 1 - AI - Normal - Setup

function scr_MKSS_Enemy_Andromeda1_AI_Normal_Setup(targetIsBoss = true)
{
	#region Physics Variables
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
	andromeda1_Attack_SlashCombo = scr_MKSS_Enemy_Nimbia_AI_Normal_SlashCombo_Step;
	#endregion
	#endregion
	
	#region Attack Order
	scr_MKSS_Enemy_Andromeda1_Normal_AttackOrder_Phase1(false);
	if (global.debug) and (keyboard_check(ord("2"))) scr_MKSS_Enemy_Andromeda1_Normal_AttackOrder_Phase2(true);
	#endregion
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 20;
	
	isBoss = targetIsBoss;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	attackStateTimer[16] = -1;
	attackStateTimerMax[16] = -1;
	
	capeSprite = spriteSet.sprCape_Idle;
	capeIndex = 0;
	capeOffsetX = 0;
	capeOffsetY = 0;
	
	tailSprite = spriteSet.sprTail_Idle;
	tailIndex = 0;
	tailOffsetX = 0;
	tailOffsetY = 0;
	
	armLBOffsetX = 0;
	armLBOffsetY = 0;
	armLB = instance_create_depth(0,0,depth-2,obj_MKSS_Attack);
	with (armLB)
	{
		owner = other.id;
		isEnemy = true;
		dmg = -1;
		
		sprite_index = other.spriteSet.sprArmLB_Idle;
		
		scr_MKSS_Attack_Andromeda1_Arm_Setup();
	}
	
	armRBOffsetX = 0;
	armRBOffsetY = 0;
	armRB = instance_create_depth(0,0,depth-2,obj_MKSS_Attack);
	with (armRB)
	{
		owner = other.id;
		isEnemy = true;
		dmg = -1;
		
		sprite_index = other.spriteSet.sprArmRB_Idle;
		
		scr_MKSS_Attack_Andromeda1_Arm_Setup();
	}
	
	armLTOffsetX = 0;
	armLTOffsetY = 0;
	armLT = instance_create_depth(0,0,depth-1,obj_MKSS_Attack);
	with (armLT)
	{
		owner = other.id;
		isEnemy = true;
		dmg = -1;
		
		sprite_index = other.spriteSet.sprArmLT_Idle;
		
		scr_MKSS_Attack_Andromeda1_Arm_Setup();
	}
	
	armRTOffsetX = 0;
	armRTOffsetY = 0;
	armRT = instance_create_depth(0,0,depth-1,obj_MKSS_Attack);
	with (armRT)
	{
		owner = other.id;
		isEnemy = true;
		dmg = -1;
		
		sprite_index = other.spriteSet.sprArmRT_Idle;
		
		scr_MKSS_Attack_Andromeda1_Arm_Setup();
	}
	#endregion
	
	#region AI Scripts
	enemyAICleanUp = scr_MKSS_Enemy_Andromeda1_AI_Normal_CleanUp;
	enemyBeginStep = scr_MKSS_Enemy_Andromeda1_Normal_BeginStep;
	enemyAIStepIdle = scr_MKSS_Enemy_Andromeda1_AI_Normal_Idle_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAnimationEnd = scr_MKSS_Enemy_Andromeda1_AI_Normal_AnimationEnd;
	enemyDraw = scr_MKSS_Enemy_Andromeda1_Normal_Draw;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Nimbia_Palette_Normal;
	#endregion
}
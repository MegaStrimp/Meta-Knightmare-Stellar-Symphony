///@description MKSS - Enemy - Chasse-Emee - AI - Normal - Setup

function scr_MKSS_Enemy_ChasseEmee_AI_Normal_Setup(targetIsBoss = true)
{
	#region Physics Variables
	movespeedIntro = 4;
	
	jumpspeed = 3;
	
	decel = .1;
	decelFast = .3;
	decelIntro = .05;
	decelStun = .15;
	
	grav = .16;
	
	gravLimit = 6;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	#region Attack Scripts
	#region Phase 1
	chasse_Attack_HeavyDash = scr_MKSS_Enemy_ChasseEmee_AI_Normal_HeavyDash_Step;
	chasse_Attack_CannonballBounce = scr_MKSS_Enemy_ChasseEmee_AI_Normal_CannonballBounce_Step;
	chasse_Attack_ThrustCombo = scr_MKSS_Enemy_ChasseEmee_AI_Normal_ThrustCombo_Step;
	chasse_Attack_ClawLaunch = scr_MKSS_Enemy_ChasseEmee_AI_Normal_ClawLaunch_Step;
	chasse_Attack_UltraSword = scr_MKSS_Enemy_ChasseEmee_AI_Normal_UltraSword_Step;
	chasse_Attack_ShakeEnemies = scr_MKSS_Enemy_ChasseEmee_AI_Normal_ShakeEnemies_Step;
	chasse_Attack_BackgroundCannonballs = scr_MKSS_Enemy_ChasseEmee_AI_Normal_BackgroundCannonballs_Step;
	#endregion
	
	#region Phase 2
	chasse_Attack_RepeatJump = scr_MKSS_Enemy_ChasseEmee_AI_Normal_RepeatJump_Step;
	chasse_Attack_PearlShot = scr_MKSS_Enemy_ChasseEmee_AI_Normal_PearlShot_Step;
	#endregion
	#endregion
	
	#region Attack Order
	//ds_list_add(attackList,chasse_Attack_RepeatJump);
	//ds_list_add(attackList,chasse_Attack_RepeatJump);
	//ds_list_add(attackList,chasse_Attack_RepeatJump);
	
	scr_MKSS_Enemy_ChasseEmee_Normal_AttackOrder_Phase1(false);
	#endregion
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 30;
	
	isBoss = targetIsBoss;
	enemyPhase = 1;
	if (global.debug) and (keyboard_check(ord("2"))) 
	{
		enemyPhase = 2;
		scr_MKSS_Enemy_ChasseEmee_Normal_AttackOrder_Phase2(true);
		with (instance_create_layer(room_width/2,130,"BackgroundChasse",obj_MKSS_Attack))
		{
			owner = other;
			isEnemy = true;
			dmg = -1;
			sprite_index = other.spriteSet.sprShipBackground;
			mask_index = -1;
			destroyOutsideRoom = false;
			scr_MKSS_Attack_ChasseEmee_BackgroundShip_Setup();
		}
	}
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
	enemyDraw = scr_MKSS_Enemy_ChasseEmee_AI_Normal_Draw;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_ChasseEmee_Palette_Normal;
	#endregion
}
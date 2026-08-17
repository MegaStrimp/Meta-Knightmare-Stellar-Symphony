///@description MKSS - Enemy - Ghoul Knight - AI - Walk and Attack - Setup

function scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Setup()
{
	#region Physics Variables
	decel = .1;
	
	movespeed = .5;
	
	grav = .2;
	
	gravLimit = 3;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	GhoulKnight_Attack_Stab = scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Stab_Step;
	GhoulKnight_Attack_Parry = scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Parry_Step;
	GhoulKnight_Attack_Counter = scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Counter_Step;
	
	ds_list_add(attackList,GhoulKnight_Attack_Stab);
	ds_list_add(attackList,GhoulKnight_Attack_Parry);
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 20;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	#endregion
	
	#region AI Scripts
	enemyAIStepIdle = scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAnimationEnd = scr_MKSS_Enemy_GhoulKnight_AI_WalkAndAttack_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_GhoulKnight_Palette_Normal;
	#endregion
}
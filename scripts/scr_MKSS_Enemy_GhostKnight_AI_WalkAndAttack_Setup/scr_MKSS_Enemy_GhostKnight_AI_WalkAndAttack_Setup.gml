///@description MKSS - Enemy - Ghost Knight - AI - Walk and Attack - Setup

function scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Setup()
{
	#region Physics Variables
	decel = .1;
	
	movespeed = .5;
	
	grav = .2;
	
	gravLimit = 3;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	
	ghostKnight_Attack_Stab = scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Stab_Step;
	ghostKnight_Attack_Parry = scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Parry_Step;
	ghostKnight_Attack_Counter = scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Counter_Step;
	
	ds_list_add(attackList,ghostKnight_Attack_Stab);
	ds_list_add(attackList,ghostKnight_Attack_Stab);
	//ds_list_add(attackList,ghostKnight_Attack_Parry);
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 45;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	#endregion
	
	#region AI Scripts
	enemyAIStepIdle = scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAnimationEnd = scr_MKSS_Enemy_GhostKnight_AI_WalkAndAttack_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_GhostKnight_Palette_Normal;
	#endregion
}
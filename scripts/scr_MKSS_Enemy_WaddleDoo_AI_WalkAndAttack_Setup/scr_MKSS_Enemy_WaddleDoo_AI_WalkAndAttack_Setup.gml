///@description MKSS - Enemy - Waddle Doo - AI - Walk and Attack - Setup

function scr_MKSS_Enemy_WaddleDoo_AI_WalkAndAttack_Setup()
{
	#region Physics Variables
	decel = .1;
	
	movespeed = .5;
	
	grav = .2;
	
	gravLimit = 3;
	#endregion
	
	#region Gameplay Variables
	waddleDoo_Beam = scr_MKSS_Enemy_WaddleDoo_AI_WalkAndAttack_Beam_Step;
	
	attackTimer = -1;
	attackTimerMax = 120;
	#endregion
	
	#region Attack Variables
	attackState = 0;
	#endregion
	
	#region AI Scripts
	enemyAIStepIdle = scr_MKSS_Enemy_WaddleDoo_AI_WalkAndAttack_Step;
	enemyAIStep = enemyAIStepIdle;
	//enemyAnimationEnd = scr_MKSS_Enemy_WaddleDoo_AI_WalkAndAttack_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_WaddleDoo_Palette_Normal;
	#endregion
}
///@description MKSS - Enemy - Peezer - AI - Walk and Attack - Setup

function scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Setup()
{
	#region Physics Variables
	decel = .05;
	
	movespeed = 1;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Peezer_AI_WalkAndAttack_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Peezer_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	attackState = 0;
	attackTimerMax = 30;
	attackTimer = -1;
	
	revertTimer = -1;
	revertTimerMax = 120;
	#endregion
}
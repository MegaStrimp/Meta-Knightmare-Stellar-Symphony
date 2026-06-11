///@description MKSS - Enemy - Rango - AI - Jump and Attack - Setup

function scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Setup()
{
	#region Components
	scr_Component_BasicHorizontal_Setup(.25);
	#endregion
	
	#region Physics Variables
	decel = .05;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Swim_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Rango_AI_JumpAndAttack_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Rango_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	attackState = 0;
	attackTimerMax = 30;
	attackTimer = -1;
	
	revertTimer = -1;
	revertTimerMax = 120;
	#endregion
}
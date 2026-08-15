///@description MKSS - Enemy - Keke - AI - Float and Attack - Setup

function scr_MKSS_Enemy_Keke_AI_FloatAndAttack_Setup()
{
	#region Component Setup
	scr_Component_UpAndDown_Setup(.5,.075,45,45);
	vsp = jumpspeed * -dirY * speedMultFinal;
	scr_Component_BasicHorizontal_Setup(.25);
	#endregion
	
	#region Physics Variables
	decel = .05;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	attackState = 0;
	attackTimerMax = 120;
	attackTimerMin = 30;
	attackTimer = attackTimerMax;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Keke_AI_FloatAndAttack_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Keke_AI_FloatAndAttack_AnimationEnd;
	#endregion
	
	#region Visual Variables
	dirYEffectDraw = false;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Keke_Palette_FloatAndAttack;
	#endregion
}
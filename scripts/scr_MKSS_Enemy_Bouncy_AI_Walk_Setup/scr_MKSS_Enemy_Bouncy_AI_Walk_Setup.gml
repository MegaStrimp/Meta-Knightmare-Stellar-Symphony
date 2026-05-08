///@description MKSS - Enemy - Bouncy - AI - Walk - Setup

function scr_MKSS_Enemy_Bouncy_AI_Walk_Setup()
{
	#region Component Setup
	scr_Component_BasicHorizontal_Setup(.5);
	#endregion
	
	#region Physics Variables
	decel = .05;
	
	jumpspeed = 3;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Bouncy_AI_Walk_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Bouncy_AI_Walk_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Bouncy_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	jumpTimerMax = 15;
	jumpTimer = jumpTimerMax;
	#endregion
}
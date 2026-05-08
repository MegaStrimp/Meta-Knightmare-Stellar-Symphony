///@description MKSS - Enemy - Bouncy - AI - Idle - Setup

function scr_MKSS_Enemy_Bouncy_AI_Idle_Setup()
{
	#region Physics Variables
	decel = .05;
	
	jumpspeed1 = 2;
	jumpspeed2 = 3;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Bouncy_AI_Idle_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Bouncy_AI_Idle_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Bouncy_Palette_Idle;
	#endregion
	
	#region Gameplay Variables
	points = 100;
	jumpTimerMax = 15;
	jumpTimer = jumpTimerMax;
	jumpCount = 0;
	#endregion
}
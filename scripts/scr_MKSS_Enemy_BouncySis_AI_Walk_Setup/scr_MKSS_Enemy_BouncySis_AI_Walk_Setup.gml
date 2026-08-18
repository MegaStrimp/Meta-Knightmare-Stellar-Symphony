///@description MKSS - Enemy - Bouncy Sis - AI - Walk - Setup

function scr_MKSS_Enemy_BouncySis_AI_Walk_Setup()
{
	#region Physics Variables
	movespeedNormal = .35;
	movespeedSpin = 1;
	
	decel = .05;
	
	jumpspeed = 3;
	jumpspeedSpin = 4;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Component Setup
	scr_Component_BasicHorizontal_Setup(movespeedNormal);
	#endregion
	
	#region AI Scripts
	enemyAIStepIdle = scr_MKSS_Enemy_BouncySis_AI_Walk_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAnimationEnd = scr_MKSS_Enemy_BouncySis_AI_Walk_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_BouncySis_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	bouncySis_Spin = scr_MKSS_Enemy_BouncySis_AI_Walk_Spin_Step;
	
	jumpCount = 0;
	jumpCountMax = 3;
	
	jumpTimerMax = 15;
	jumpTimer = jumpTimerMax;
	
	heartTimer = -1;
	heartTimerMax = 3;
	#endregion
}
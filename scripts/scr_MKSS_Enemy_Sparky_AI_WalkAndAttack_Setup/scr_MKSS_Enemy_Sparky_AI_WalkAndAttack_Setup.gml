///@description MKSS - Enemy - Sparky - AI - Walk and Attack - Setup

function scr_MKSS_Enemy_Sparky_AI_WalkAndAttack_Setup()
{
	#region Physics Variables
	movespeedNormal = .5;
	movespeedSpin = 1.5;
	
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
	enemyAIStepIdle = scr_MKSS_Enemy_Sparky_AI_WalkAndAttack_Step;
	enemyAIStep = enemyAIStepIdle;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Sparky_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	sparky_Spark = scr_MKSS_Enemy_Sparky_AI_WalkAndAttack_Spark_Step;
	
	jumpCount = 0;
	jumpCountMax = 3;
	
	jumpTimerMax = 15;
	jumpTimer = jumpTimerMax;
	
	heartTimer = -1;
	heartTimerMax = 5;
	#endregion
}
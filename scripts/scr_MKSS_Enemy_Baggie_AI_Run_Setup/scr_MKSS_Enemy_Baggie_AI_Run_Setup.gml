///@description MKSS - Enemy - Baggie - AI - Run - Setup

function scr_MKSS_Enemy_Baggie_AI_Run_Setup()
{
	#region Physics Variables
	decel = .05;
	
	movespeed = 2;
	jumpspeed = 3;
	
	grav = .17;
	
	gravLimit = 3;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Baggie_AI_Run_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Baggie_AI_Run_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Baggie_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	isEnraged = false;
	canChangeDirection = false;
	
	playerSpotRange = 80;
	playerSpotTimer = -1;
	playerSpotTimerMax = 30;
	
	runBegin = false;
	runParticleNum = 0;
	runParticleTimer = -1;
	runParticleTimerMin = 5;
	runParticleTimerMax = 55;
	#endregion
}
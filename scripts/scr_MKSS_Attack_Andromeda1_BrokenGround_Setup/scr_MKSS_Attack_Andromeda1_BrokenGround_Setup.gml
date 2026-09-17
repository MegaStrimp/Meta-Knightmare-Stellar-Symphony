///@description MKSS - Attack - Andromeda 1 - Broken Ground - Setup

function scr_MKSS_Attack_Andromeda1_BrokenGround_Setup()
{
	pauseAfterAnimation = true;
	
	dmgStartTimer = 30;
	
	particleTimerMax = 12;
	particleTimer = particleTimerMax;
	
	sparkTimerMax = 32;
	sparkTimer = sparkTimerMax;
	
	attackAIStep = scr_MKSS_Attack_Andromeda1_BrokenGround_Step;
}
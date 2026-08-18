///@description MKSS - Attack - Starless Marx - Vine - Setup

function scr_MKSS_Attack_StarlessMarx_Vine_Setup()
{
	growTimerMax = 4;
	growTimer = growTimerMax;
	
	vineAmount = 7;
	vineDestroyTimerMax = growTimerMax * vineAmount;
	vineDestroyTimer = vineDestroyTimerMax;
	
	attackAIStep = scr_MKSS_Attack_StarlessMarx_Vine_Step;
}
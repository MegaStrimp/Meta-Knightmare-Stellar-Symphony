///@description MKSS - Attack - Chasse Emee - Background Ship - Setup

function scr_MKSS_Attack_ChasseEmee_BackgroundShip_Setup()
{
	hsp = 0;
	vsp = 0;
	
	shotTimerMaxMin = 300;
	shotTimerMaxMax = 480;
	shotTimer = irandom_range(shotTimerMaxMin,shotTimerMaxMax);
	
	attackAIStep = scr_MKSS_Attack_ChasseEmee_BackgroundShip_Step;
}
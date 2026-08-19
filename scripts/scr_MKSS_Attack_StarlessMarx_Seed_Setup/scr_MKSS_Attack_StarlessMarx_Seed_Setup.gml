///@description MKSS - Attack - Starless Marx - Seed - Setup

function scr_MKSS_Attack_StarlessMarx_Seed_Setup()
{
	hsp = 0;
	vsp = 2;
	
	grav = .15;
	gravLimit = 8;
	
	growTimerMax = 90;
	growTimer = -1;
	
	attackAIStep = scr_MKSS_Attack_StarlessMarx_Seed_Step;
}
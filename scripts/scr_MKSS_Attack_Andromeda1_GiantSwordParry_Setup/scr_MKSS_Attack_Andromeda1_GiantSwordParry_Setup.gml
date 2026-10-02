///@description MKSS - Attack - Andromeda 1 - Giant Sword Parry - Setup

function scr_MKSS_Attack_Andromeda1_GiantSwordParry_Setup()
{
	hsp = 0;
	vsp = -6;
	
	grav = .15;
	gravLimit = 5;
	
	rotateSpd = 10;
	rotateDir = 1;
	
	target = -1;
	
	destroyTimer = 900;
	
	starTimer = 20;
	
	yTarget = 192;
	stuck = false;
	
	attackAIStep = scr_MKSS_Attack_Andromeda1_GiantSwordParry_Step;
}
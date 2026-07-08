///@description MKSS - Attack - Nimbia - Kracklet - Setup

function scr_MKSS_Attack_Nimbia_Kracklet_Setup()
{
	hsp = 0;
	vsp = 0;
	
	spd = 0;
	decel = .1;
	spdMax = 8;
	
	movementTimerMaxAdd = 30;
	movementTimerMax = 90;
	movementTimer = movementTimerMax;
	movementRangeMin = 16;
	movementRangeMax = 48;
	movementDmgCooldownMax = 20;
	movementDmgCooldown = -1;
	movementLimit = 8;
	
	owner.krackletAmount++;
	
	attackAIStep = scr_MKSS_Attack_Nimbia_Kracklet_Step;
}
///@description MKSS - Attack - Nimbia - Kracklet - Setup

function scr_MKSS_Attack_Nimbia_Kracklet_Setup()
{
	hsp = 0;
	vsp = 0;
	
	spd = 0;
	decel = .1;
	spdMax = 8;
	
	movementTimerMaxAdd = 30;
	movementTimerMax = 60;
	movementTimer = movementTimerMax;
	movementRangeMin = 16;
	movementRangeMax = 48;
	movementDmgCooldownMax = 20;
	movementDmgCooldown = -1;
	movementLimit = 8;
	movementX = x;
	movementY = y;
	movementFrames = 6;
	movementTargetX = -1;
	movementTargetY = -1;
	
	init = false;
	
	owner.krackletAmount++;
	
	eyeAngle = 0;
	
	attackDraw = scr_MKSS_Attack_Nimbia_Kracklet_Draw;
	attackAIStep = scr_MKSS_Attack_Nimbia_Kracklet_Step;
}
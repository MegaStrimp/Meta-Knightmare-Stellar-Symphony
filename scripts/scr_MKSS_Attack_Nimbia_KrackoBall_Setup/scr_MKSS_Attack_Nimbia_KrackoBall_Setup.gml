///@description MKSS - Attack - Nimbia - Kracko Ball - Setup

function scr_MKSS_Attack_Nimbia_KrackoBall_Setup()
{
	hsp = 0;
	vsp = 0;
	
	spd = 0;
	angle = 0;
	spdMax = 8;
	accel = .25;
	
	shot = false;
	
	growTimerMax = 18;
	growTimer = growTimerMax;
	growAmount = .15;
	
	rotateTimerMax = 12;
	rotateTimer = rotateTimerMax;
	rotateAmount = 90;
	
	attackAIStep = scr_MKSS_Attack_Nimbia_KrackoBall_Step;
}
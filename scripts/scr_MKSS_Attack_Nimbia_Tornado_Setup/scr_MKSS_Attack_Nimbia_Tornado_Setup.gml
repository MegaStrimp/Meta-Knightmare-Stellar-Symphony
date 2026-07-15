///@description MKSS - Attack - Nimbia - Tornado - Setup

function scr_MKSS_Attack_Nimbia_Tornado_Setup(_airMovement = false)
{
	hsp = 0;
	vsp = 0;
	
	airMovement = _airMovement;
	
	moveDir = dirX;
	xMiddle = xstart;
	distance = 72;
	
	accel = .15;
	speedMax = random_range(2,3.5);
	
	attackAIStep = scr_MKSS_Attack_Nimbia_Tornado_Step;
}
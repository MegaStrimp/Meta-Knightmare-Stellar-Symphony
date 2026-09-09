///@description MKSS - Attack - Andromeda 1 - Star Shot - Setup

function scr_MKSS_Attack_Andromeda1_StarShot_Setup()
{
	hsp = 0;
	vsp = 0;
	
	spd = 5;
	angle = 0;
	
	rotateSpd = 3;
	rotateSpdBack = 10;
	rotateAngle = irandom_range(0,359);
	rotateAngleBack = (rotateAngle + 45) % 360;
	
	attackAIStep = scr_MKSS_Attack_Andromeda1_StarShot_Step;
	attackDraw = scr_MKSS_Attack_Andromeda1_StarShot_Draw;
}
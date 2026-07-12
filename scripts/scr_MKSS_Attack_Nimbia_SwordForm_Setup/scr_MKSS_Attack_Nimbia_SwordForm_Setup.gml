///@description MKSS - Attack - Nimbia - Sword Form - Setup

function scr_MKSS_Attack_Nimbia_SwordForm_Setup()
{
	offsetXDefault = 0;
	offsetYDefault = 0;
	offsetX = 0;
	offsetY = 0;
	shake = 0;
	
	swordLength = 0;
	swordLengthSpeed = 1;
	swordLengthMax = 16;
	
	prepareTimerMax = 50;
	prepareTimer = -1;
	swingTimerMax = 16;
	swingTimer = -1;
	swingEndTimerMax = 60;
	swingEndTimer = -1;
	
	prepareOffset = 10;
	
	swingSpeedMax = 10;
	swingSpeed = 0;
	swingSpeedAccel = 2;
	swingSpeedDecel = 2;
	
	attackAIStep = scr_MKSS_Attack_Nimbia_SwordForm_Step;
}
///@description MKSS - Attack - Starless Marx - Marx Cannon - Setup

function scr_MKSS_Attack_StarlessMarx_MarxCannon_Setup()
{
	laserWidth = 0;
	laserWidthMax = room_width + 40;
	laserWidthGain = 16;
	
	laserHeight = 16;
	laserHeightMax = 56;
	laserHeightGain = 1;
	
	laserHeightOffset = 0;
	laserHeightOffsetAmount = 16;
	laserHeightOffsetTimerMax = 4;
	laserHeightOffsetTimer = laserHeightOffsetTimerMax;
	
	particleTimerMax = 6;
	particleTimer = particleTimerMax;
	
	laserHurtTimer = 0;
	laserHurtTimerMax = 8;
	
	damageMax = 75;
	damage = damageMax;
	
	parried = false;
					
	attackAIStep = scr_MKSS_Attack_StarlessMarx_MarxCannon_Step;
	attackDraw = scr_MKSS_Attack_StarlessMarx_MarxCannon_Draw;
}
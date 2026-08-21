///@description MKSS - Attack - Starless Marx - Black Hole - Setup

function scr_MKSS_Attack_StarlessMarx_BlackHole_Setup()
{
	blackHoleState = 0;
	blackHoleSuckSpeed = .2;
	blackHoleSuckAccel = .03;
	
	circleRadius = 108;
	circleSpeed = circleRadius / 140;
	circleAlpha = 0;
	circleAlphaGain = .005;
	
	particleTimerMax = 6;
	particleTimer = 0;
					
	attackAIStep = scr_MKSS_Attack_StarlessMarx_BlackHole_Step;
	attackDraw = scr_MKSS_Attack_StarlessMarx_BlackHole_Draw;
}
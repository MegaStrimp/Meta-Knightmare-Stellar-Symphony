///@description MKSS - Attack - Starless Marx - Minimarx Paint - Setup

function scr_MKSS_Attack_StarlessMarx_MinimarxPaint_Setup()
{
	hsp = 0;
	vsp = 0;
	
	grav = .15;
	gravLimit = 8;
	
	splat = false;
	
	createStartTimerMax = 18;
	createStartTimer = createStartTimerMax;
	
	createTimerMax = 30;
	createTimer = createTimerMax;
	
	miniDir = 1;
	if (x >= room_width / 2) miniDir = -1;
	miniScaleX = 1;
	miniScaleY = 0;
	miniShadowAlpha = 1;
	miniScaleBounce = false;
	miniSpeedSlow = .05;
	miniSpeedFast = .075;
	
	attackAIStep = scr_MKSS_Attack_StarlessMarx_MinimarxPaint_Step;
	attackDraw = scr_MKSS_Attack_StarlessMarx_MinimarxPaint_Draw;
	pauseAfterAnimation = true;
}
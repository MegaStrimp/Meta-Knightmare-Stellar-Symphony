///@description MKSS - Attack - Chasse Emee - Claw Launch - Setup

function scr_MKSS_Attack_ChasseEmee_ClawLaunch_Setup(targetOwner = owner)
{
	dirX = targetOwner.dirX;
	image_xscale = dirX;
	
	armXMin = 20;
	armXMax = 196;
	
	armX = 24;
	armY = -8;
	
	hsp = 0;
	vsp = 0;
	
	decel = .3;
	decelMax = 8;
	
	shake = 0;
	
	launch = false;
	
	clampTimerMax = 30;
	clampTimer = clampTimerMax;
	
	postClampTimerMax = 20;
	postClampTimer = postClampTimerMax;
	
	attackAIStep = scr_MKSS_Attack_ChasseEmee_ClawLaunch_Step;
	attackDraw = scr_MKSS_Attack_ChasseEmee_ClawLaunch_Draw;
}
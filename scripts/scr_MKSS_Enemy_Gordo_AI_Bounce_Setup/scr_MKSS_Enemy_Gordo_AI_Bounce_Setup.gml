///@description MKSS - Enemy - Gordo - AI - Bounce - Setup

function scr_MKSS_Enemy_Gordo_AI_Bounce_Setup()
{
	#region Physics Variables
	decel = .01;
	
	jumpspeed = 3;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Gordo_AI_Bounce_Step;
	#endregion
	
	#region Visual Variables
	dirXEffectDraw = false;
	dirYEffectDraw = false;
	drawDirX = dirX;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Gordo_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	jumpTimerMax = 1;
	jumpTimer = jumpTimerMax;
	jumpCount = 0;
	jumpCountMax = irandom_range(2,3);
	isHeld = false;
	#endregion
}
///@description MKSS - Enemy - Starless Minimarx - AI - Walk - Setup

function scr_MKSS_Enemy_StarlessMinimarx_AI_Walk_Setup()
{
	#region Physics Variables
	decel = .05;
	
	movespeed = .3;
	jumpspeed1 = 1.2;
	jumpspeed2 = 1.5;
	
	grav = .1;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_StarlessMinimarx_AI_Walk_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_StarlessMinimarx_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	jumpCount = 0;
	jumpTimerMax = 10;
	jumpTimer = jumpTimerMax;
	#endregion
}
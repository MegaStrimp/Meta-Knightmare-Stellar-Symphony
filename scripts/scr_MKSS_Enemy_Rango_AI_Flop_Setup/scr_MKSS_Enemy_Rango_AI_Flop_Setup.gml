///@description MKSS - Enemy - Rango - AI - Flop - Setup

function scr_MKSS_Enemy_Rango_AI_Flop_Setup()
{
	#region Component Setup
	scr_Component_BasicHorizontal_Setup(.75);
	#endregion
	
	#region Physics Variables
	decel = .1;
	
	jumpspeedMin = 1.5;
	jumpspeedMax = 2;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Rango_AI_Flop_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Rango_Palette_Flop;
	#endregion
	
	#region Gameplay Variables
	points = 50;
	
	jumpCount = 0;
	
	flopTimerMax = 30;
	flopTimer = flopTimerMax;
	#endregion
}
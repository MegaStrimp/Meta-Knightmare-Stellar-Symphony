///@description MKSS - Enemy - Booler - AI - Chase - Setup

function scr_MKSS_Enemy_Booler_AI_Chase_Setup()
{
	#region Component Setup
	scr_Component_UpAndDown_Setup(.75,.1,-1,-1);
	vsp = jumpspeed * -dirY * speedMultFinal;
	scr_Component_WalkAndTurn_Setup(.75,.1,-1,-1);
	#endregion
	
	#region Physics Variables
	decel = .05;
	
	grav = .15;
	
	gravLimit = 2.5;
	
	yAnchorSpd = 1;
	
	mistSpd = 4;
	#endregion
	
	#region Gameplay Variables
	targetPlayer = -1;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Booler_AI_Chase_Float_Step;
	#endregion
	
	#region Visual Variables
	dirXEffectDraw = false;
	dirYEffectDraw = false;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Booler_Palette_Normal;
	#endregion
}
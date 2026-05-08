///@description MKSS - Enemy - Bronto Burt - AI - Fly Straight Horizontal - Setup

function scr_MKSS_Enemy_BrontoBurt_AI_FlyStraightHorizontal_Setup()
{
	#region Component Setup
	scr_Component_UpAndDown_Setup(.5,.075,45,45);
	vsp = jumpspeed * -dirY * speedMultFinal;
	scr_Component_BasicHorizontal_Setup(.25);
	#endregion
	
	#region Physics Variables
	decel = .05;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_BrontoBurt_AI_FlyStraightHorizontal_Step;
	#endregion
	
	#region Visual Variables
	dirYEffectDraw = false;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_BrontoBurt_Palette_Normal;
	#endregion
}
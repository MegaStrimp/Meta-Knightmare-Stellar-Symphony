///@description MKSS - Enemy - Keke - AI - Float - Setup

function scr_MKSS_Enemy_Keke_AI_Float_Setup()
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
	enemyAIStep = scr_MKSS_Enemy_Keke_AI_Float_Step;
	#endregion
	
	#region Visual Variables
	dirYEffectDraw = false;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Keke_Palette_Normal;
	#endregion
}
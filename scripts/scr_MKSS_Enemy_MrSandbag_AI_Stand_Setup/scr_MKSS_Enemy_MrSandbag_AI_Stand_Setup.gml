///@description MKSS - Enemy - Mr Sandbag - AI - Stand - Setup

function scr_MKSS_Enemy_MrSandbag_AI_Stand_Setup()
{
	#region Physics Variables
	decel = .05;
	
	movespeed = .25;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_MrSandbag_AI_Stand_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_MrSandbag_Palette_Normal;
	#endregion
}
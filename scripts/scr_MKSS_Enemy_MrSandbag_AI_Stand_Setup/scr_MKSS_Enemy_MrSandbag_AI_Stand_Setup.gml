///@description MKSS - Enemy - Mr Sandbag - AI - Stand - Setup

function scr_MKSS_Enemy_MrSandbag_AI_Stand_Setup()
{
	#region Sprites
	mask_index = spr_MKSS_Enemy_MrSandbag_CollisionMask;
	
	sprIdle = spr_MKSS_Enemy_MrSandbag_Base_Idle;
	
	var i = 0;
	sprHurt[i][0] = spr_MKSS_Enemy_MrSandbag_Base_Hurt1;
	sprHurt[i][1] = 10;
	i += 1;
	sprHurt[i][0] = spr_MKSS_Enemy_MrSandbag_Base_Hurt2;
	sprHurt[i][1] = 10;
	#endregion
	
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
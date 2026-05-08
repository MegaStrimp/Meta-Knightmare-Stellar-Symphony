///@description MKSS - Enemy - Trappy - AI - Naked - Setup

function scr_MKSS_Enemy_Trappy_AI_Naked_Setup()
{
	#region Physics Variables
	decel = .05;
	
	movespeed = .25;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Sprites
	sprHurt = spriteSet.sprHurtList_Naked;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Trappy_AI_Naked_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Trappy_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	defense = 1;
	knockbackResistance = 1
	#endregion
}
///@description MKSS - Enemy - Waddle Dee - AI - Idle - Setup

function scr_MKSS_Enemy_WaddleDee_AI_Idle_Setup()
{
	#region Sprites
	targetIdleSprite = choose(spriteSet.sprIdle,spriteSet.sprSleep);
	#endregion
	
	#region Physics Variables
	decel = .05;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	hp = 1;
	points = 50;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_WaddleDee_AI_Idle_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_WaddleDee_Palette_Idle;
	#endregion
}
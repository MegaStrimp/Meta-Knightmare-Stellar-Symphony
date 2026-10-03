///@description MKSS - Enemy - Searches - AI - Idle - Setup

function scr_MKSS_Enemy_Searches_AI_Idle_Setup()
{
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Searches_AI_Idle_Step;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Searches_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	playerSpotRange = 80;
	
	explodeTimer = -1;
	explodeTimerMax = 120;
	#endregion
}
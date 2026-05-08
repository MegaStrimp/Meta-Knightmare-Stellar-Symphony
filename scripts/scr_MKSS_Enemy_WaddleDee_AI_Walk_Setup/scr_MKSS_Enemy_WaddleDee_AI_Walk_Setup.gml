///@description MKSS - Enemy - Waddle Dee - AI - Walk - Setup

function scr_MKSS_Enemy_WaddleDee_AI_Walk_Setup()
{
	#region Physics Variables
	decel = .05;
	decelThrown = .02;
	
	movespeed = .25;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_WaddleDee_AI_Walk_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_WaddleDee_AI_Walk_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_WaddleDee_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	isHeld = false;
	isThrown = false;
	thrownTimer = -1;
	thrownTimerMax = 90;
	#endregion
}
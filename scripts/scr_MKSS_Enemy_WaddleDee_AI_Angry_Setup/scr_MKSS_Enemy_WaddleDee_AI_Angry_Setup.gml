///@description MKSS - Enemy - Waddle Dee - AI - Angry - Setup

function scr_MKSS_Enemy_WaddleDee_AI_Angry_Setup()
{
	#region Physics Variables
	decel = .05;
	decelThrown = .05;
	
	movespeed = .25;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_WaddleDee_AI_Angry_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_WaddleDee_AI_Angry_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_WaddleDee_Palette_Angry;
	#endregion
	
	#region Gameplay Variables
	points = 150;
	
	attackState = 0;
	attackTimer = 0;
	attackTimerMax1 = 45;
	attackTimerMax2 = 90;
	
	attack_Jump_Range = 64;
	attack_Jump_Movespeed = 1.5;
	attack_Jump_Jumpspeed = 2;
	
	isHeld = false;
	isThrown = false;
	thrownTimer = -1;
	thrownTimerMax = 90;
	#endregion
}
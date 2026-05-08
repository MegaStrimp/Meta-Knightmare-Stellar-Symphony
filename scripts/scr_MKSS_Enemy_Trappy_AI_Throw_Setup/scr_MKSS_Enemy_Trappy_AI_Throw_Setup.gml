///@description MKSS - Enemy - Trappy - AI - Throw - Setup

function scr_MKSS_Enemy_Trappy_AI_Throw_Setup()
{
	#region Physics Variables
	decel = .05;
	
	jumpspeed = 1;
	
	grav = .2;
	
	gravLimit = 3.5;
	#endregion
	
	#region Sprites
	sprHurt = spriteSet.sprHurtList_Chest;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Trappy_AI_Throw_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Trappy_AI_Throw_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Trappy_Palette_Normal;
	#endregion
	
	#region Gameplay Variables
	defense = 2;
	knockbackResistance = 2;
	
	hopTimerMax = 60;
	hopTimer = hopTimerMax;
	isHopping = false;
	
	attackTimerMax = 150;
	attackTimer = attackTimerMax;
	attackCount = -1;
	isAttacking = false;
	
	jumpBuffer = false;
	
	throwTimer = -1;
	throwTimerMax = 30;
	#endregion
}
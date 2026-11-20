///@description MKSS - Enemy - Trappy - AI - Straight - Setup

function scr_MKSS_Enemy_Trappy_AI_Straight_Setup()
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
	enemyAIStep = scr_MKSS_Enemy_Trappy_AI_Straight_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Trappy_AI_Straight_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Trappy_Palette_Straight;
	#endregion
	
	#region Gameplay Variables
	defense = 3;
	knockbackResistance = 3;
	
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
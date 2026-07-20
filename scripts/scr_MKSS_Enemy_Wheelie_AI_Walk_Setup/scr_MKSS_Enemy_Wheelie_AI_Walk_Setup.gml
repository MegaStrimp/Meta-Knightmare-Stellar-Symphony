///@description MKSS - Enemy - Wheelie - AI - Walk - Setup

function scr_MKSS_Enemy_Wheelie_AI_Walk_Setup()
{
	#region Component Setup
	scr_Component_WalkAndTurn_Setup(1,.1,-1,-1);
	#endregion
	
	#region Physics Variables
	decel = .1;
	
	grav = .2;
	
	gravLimit = 3;
	#endregion
	
	#region Gameplay Variables
	hp = MKSS_Base_EnemyHP_Fodder;
	points = MKSS_Base_EnemyPoints_Fodder;
	metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Fodder;
	
	isTurning = false;
	#endregion
	
	#region AI Scripts
	enemyAIStepIdle = scr_MKSS_Enemy_Wheelie_AI_Walk_Step;
	enemyAIStep = enemyAIStepIdle;
	enemyAnimationEnd = scr_MKSS_Enemy_Wheelie_AI_Walk_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_Wheelie_Palette_Walk;
	#endregion
}
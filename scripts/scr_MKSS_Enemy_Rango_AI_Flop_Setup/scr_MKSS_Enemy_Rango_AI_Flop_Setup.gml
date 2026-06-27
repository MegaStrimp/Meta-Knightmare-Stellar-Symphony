///@description MKSS - Enemy - Rango - AI - Flop - Setup

function scr_MKSS_Enemy_Rango_AI_Flop_Setup(fromAttacker = false)
{
	#region Component Setup
	scr_Component_BasicHorizontal_Setup(.75);
	#endregion
	
	#region Physics Variables
	decel = .1;
	
	jumpspeedMin = 1.5;
	jumpspeedMax = 2;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_Rango_AI_Flop_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_Rango_AI_Flop_AnimationEnd;
	#endregion
	
	#region Palette Variables
	if (!fromAttacker) palSprite = spr_MKSS_Enemy_Rango_Palette_Flop;
	#endregion
	
	#region Gameplay Variables
	if (!fromAttacker)
	{
		hp = MKSS_Base_EnemyHP_Fodder;
		points = MKSS_Base_EnemyPoints_Fodder;
		metaPointsOnDeath = MKSS_Base_EnemyMetaPoints_Fodder;
	}
	
	jumpCount = 0;
	
	flopTimerMax = 30;
	flopTimer = flopTimerMax;
	#endregion
}
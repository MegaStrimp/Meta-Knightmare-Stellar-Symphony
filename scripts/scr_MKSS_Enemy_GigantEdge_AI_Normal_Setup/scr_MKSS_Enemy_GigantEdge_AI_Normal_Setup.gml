///@description MKSS - Enemy - Gigant Edge - AI - Normal - Setup

function scr_MKSS_Enemy_GigantEdge_AI_Normal_Setup(targetIsBoss = true,targetPlayBossTheme = true)
{
	#region Physics Variables
	jumpspeed = 3;
	
	decel = .05;
	decelStun = .15;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	attackList = ds_list_create();
	thrownEnemyList = ds_list_create();
	thrownEnemyStateList = ds_list_create();
	
	hasWalked = false;
	
	ds_list_add(attackList,global.MKSS_AttackIDs[? "gigantEdge_SwordSwing"]);
	ds_list_add(attackList,global.MKSS_AttackIDs[? "gigantEdge_SwordSwing"]);
	
	attackListIndex = 0;
	
	attackTimer = -1;
	attackTimerMax = 20;
	
	heldEnemy = -1;
	
	isBoss = targetIsBoss;
	playBossTheme = targetPlayBossTheme;
	#endregion
	
	#region AI Scripts
	enemyAICleanUp = scr_MKSS_Enemy_GigantEdge_AI_Normal_CleanUp;
	enemyAIStep = scr_MKSS_Enemy_GigantEdge_AI_Normal_Idle_Step
	enemyAnimationEnd = scr_MKSS_Enemy_GigantEdge_AI_Normal_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_GigantEdge_Palette_Normal;
	#endregion
}
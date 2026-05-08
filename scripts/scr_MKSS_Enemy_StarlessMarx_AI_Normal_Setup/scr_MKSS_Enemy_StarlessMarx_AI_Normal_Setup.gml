///@description MKSS - Enemy - Starless Marx - AI - Normal - Setup

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Setup()
{
	#region Physics Variables
	decel = .05;
	decelStun = .25;
	
	grav = .15;
	
	gravLimit = 2.5;
	#endregion
	
	#region Gameplay Variables
	attackTimer = -1;
	attackTimerMax = 90;
	floatOffset = 0;
	
	shooterCutter_Count = 0;
	shooterCutter_CurrentCutterIndex = 0;
	shooterCutter_ParriableCutterIndex = 0;
	shooterCutter_AttackTimer = -1;
	shooterCutter_AttackTimerMax = 60;
	shooterCutter_CancelTimer = -1;
	shooterCutter_CancelTimerMax = 30;
	
	teleport_TargetX = 0;
	teleport_TargetY = 0;
	teleport_TargetState = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step;
	teleport_CanFadeOut = true;
	teleport_RandomCount = 0;
	teleport_TeleportTimer = -1;
	teleport_TeleportTimerMin = 10;
	teleport_TeleportTimerMax = 30;
	#endregion
	
	#region Sprites
	sprite_index = spriteSet.sprAppear;
	#endregion
	
	#region AI Scripts
	enemyAIStep = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Appear_Step;
	enemyAnimationEnd = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Appear_AnimationEnd;
	#endregion
	
	#region Palette Variables
	palSprite = spr_MKSS_Enemy_WaddleDee_Palette_Idle; //STRIMPTODO CHANGE
	#endregion
}
///@description MKSS - Enemy - Starless Marx - Teleport

function scr_MKSS_Enemy_StarlessMarx_Teleport(targetX = 0,targetY = 0,targetState = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Idle_Step,canFadeOut = true,randomCount = 0,teleportTimerMax = 30)
{
	scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_StarlessMarx_AI_Normal_Teleport_Step);
	
	teleport_TargetX = targetX;
	teleport_TargetY = targetY;
	teleport_TargetState = targetState;
	teleport_CanFadeOut = canFadeOut;
	teleport_RandomCount = randomCount;
	teleport_TeleportTimerMax = teleportTimerMax;
}
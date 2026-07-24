///@description MKSS - Attack - Chasse Emee - Cannonball - Setup

function scr_MKSS_Attack_ChasseEmee_Cannonball_Setup()
{
	grav = .2;
	gravLimit = 12;
	
	bounceTimesMax = 1;
	bounceTimes = bounceTimesMax;
	
	bounceDelayTimer = -1;
	bounceDelayTimerMax = 4;
	
	parryAttackIndex = global.MKSS_AttackIDs[? "metaKnight_ParryCannonball"];
	
	attackAIStep = scr_MKSS_Attack_ChasseEmee_Cannonball_Step;
}
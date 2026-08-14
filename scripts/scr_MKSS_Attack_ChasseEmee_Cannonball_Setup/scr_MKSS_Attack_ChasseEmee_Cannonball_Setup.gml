///@description MKSS - Attack - Chasse Emee - Cannonball - Setup

function scr_MKSS_Attack_ChasseEmee_Cannonball_Setup(_parry = global.MKSS_AttackIDs[? "metaKnight_ParryCannonball"])
{
	grav = .2;
	gravLimit = 12;
	hasGravity = false;
	
	bounceTimesMax = 1;
	bounceTimes = bounceTimesMax;
	
	bounceDelayTimer = -1;
	bounceDelayTimerMax = 4;
	
	parryAttackIndex = _parry;
	
	attackAIStep = scr_MKSS_Attack_ChasseEmee_Cannonball_Step;
}
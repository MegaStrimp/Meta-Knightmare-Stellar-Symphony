///@description MKSS - Attack - Chasse Emee - Sword Claw - Setup

function scr_MKSS_Attack_ChasseEmee_SwordClaw_Setup(targetOwner = owner)
{
	dirX = targetOwner.dirX;
	image_xscale = dirX;
	
	armXMin = -64;
	armXMax = 48;
	
	armX = -32;
	armY = -8;
	
	hsp = 0;
	vsp = 0;
	
	decel = .25;
	
	attackAIStep = scr_MKSS_Attack_ChasseEmee_SwordClaw_Step;
}
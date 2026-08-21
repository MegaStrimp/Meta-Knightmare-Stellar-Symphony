///@description MKSS - Attack - Starless Marx - Arrow - Setup

function scr_MKSS_Attack_StarlessMarx_Arrow_Setup(_spd = 8 + random_range(-6,6))
{
	hsp = 0;
	vsp = 0;
	
	spd = _spd;
	spdMin = random_range(0,.3);
	spdMax = 12 + random_range(0,6);
	spdMaxReverse = spdMax/3;
	angle = 0;
	
	decel = spd/12;
	accel = spdMax/18;
	accelDir = -1;
	accelTimer = 60;
	
	dmgTarget = 4;
	parryArrow = false;
	
	attackAIStep = scr_MKSS_Attack_StarlessMarx_Arrow_Step;
	pauseAfterAnimation = true;
	//attackAnimationEnd = scr_MKSS_Attack_StarlessMarx_Arrow_AnimationEnd;
}
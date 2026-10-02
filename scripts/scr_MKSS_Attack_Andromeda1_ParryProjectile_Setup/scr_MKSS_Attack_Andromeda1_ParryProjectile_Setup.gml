///@description MKSS - Attack - Andromeda 1 - Parry Projectile - Setup

function scr_MKSS_Attack_Andromeda1_ParryProjectile_Setup()
{
	hsp = 0;
	vsp = 0;
	
	spd = 3;
	angle = irandom_range(0,359);
	
	decel = .1;
	accel = .15;
	spdMax = 6;
	turnSpeed = 0;
	turnSpeedAccel = .5;
	turnSpeedMax = 12;
	turnDir = choose(-1,1);
	
	rotateSpd = 10;
	
	launchTimer = 20;
	
	target = -1;
	
	destroyTimer = 900;
	destroyAfterHit = true;
	
	particleTimerMax = 4;
	particleTimer = particleTimerMax;
	
	attackAIStep = scr_MKSS_Attack_Andromeda1_ParryProjectile_Step;
}
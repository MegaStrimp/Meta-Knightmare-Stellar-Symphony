///@description MKSS - Particle Set - Pause Stars

function scr_MKSS_ParticleSet_PauseStars(parTargetX,parTargetY,parAngle)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_CrossStar1;
	par[0].image_index = random_range(0,5);
	par[0].image_angle = random_range(0,359);
	par[0].specialBehavior_BeginStep = scr_Particle_SpecialBehavior_DestroyWhenGameIsNotPaused_BeginStep;
	par[0].imageSpeed = random_range(.5,1.25);
	par[0].hsp = lengthdir_x(.6,parAngle);
	par[0].vsp = lengthdir_y(.6,parAngle);
	par[0].destroyAfterAnimation = true;
	par[0].canBePaused = false;
	par[0].inGUI = true;
	par[0].rotateTimerMax = random_range(5,15);
	par[0].rotateTimer = par[0].rotateTimerMax;
	par[0].rotateSpd = 45 * choose(-1,1);
	
	return par;
}
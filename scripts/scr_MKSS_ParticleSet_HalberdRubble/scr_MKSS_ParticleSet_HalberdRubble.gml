///@description MKSS - Particle Set - Halberd Rubble

function scr_MKSS_ParticleSet_HalberdRubble(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 2,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_HalberdRubble;
	par[0].image_index = irandom_range(0,2);
	par[0].hsp = random_range(-4,4);
	par[0].vsp = random_range(-5,-1);
	par[0].grav = .2;
	par[0].gravLimit = 10;
	par[0].destroyTimer = 300;
	
	return par;
}
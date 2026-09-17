///@description MKSS - Particle Set - Tiny Spark

function scr_MKSS_ParticleSet_TinySpark(parTargetX,parTargetY)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_SpecialSparkle_Yellow;
	par[0].image_index = irandom_range(0,1);
	par[0].hsp = random_range(-.2,.2);
	par[0].vsp = random_range(-1.5,0);
	par[0].grav = .05;
	par[0].gravLimit = 6;
	par[0].destroyTimer = irandom_range(8,16);
	
	return par;
}
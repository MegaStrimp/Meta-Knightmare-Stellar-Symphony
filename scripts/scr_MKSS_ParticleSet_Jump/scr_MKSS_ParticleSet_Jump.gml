///@description MKSS - Particle Set - Jump

function scr_MKSS_ParticleSet_Jump(parTargetX,parTargetY,parTargetAngle)
{
	par[0] = instance_create_depth(parTargetX,parTargetY,depth + 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_Jump;
	par[0].destroyAfterAnimation = true;
	par[0].hsp = lengthdir_x(6,parTargetAngle);
	par[0].vsp = lengthdir_y(6,parTargetAngle);
	par[0].decelX = .4;
	par[0].decelY = .4;
	
	return par;
}
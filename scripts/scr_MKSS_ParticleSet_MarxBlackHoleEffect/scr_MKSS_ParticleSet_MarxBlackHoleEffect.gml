///@description MKSS - Particle Set - Marx Black Hole Effect

function scr_MKSS_ParticleSet_MarxBlackHoleEffect(parTargetX,parTargetY,parTargetLength,parTargetAngle,parTargetTimer)
{
	var _x = parTargetX + lengthdir_x(parTargetLength,parTargetAngle);
	var _y = parTargetY + lengthdir_y(parTargetLength,parTargetAngle);
	
	var spd = point_distance(_x,_y,parTargetX,parTargetY) / parTargetTimer;
	var angle = point_direction(_x,_y,parTargetX,parTargetY);
	
	par[0] = instance_create_depth(_x,_y,depth - 1,obj_Particle);
	par[0].sprite_index = spr_MKSS_Particle_BlackHoleEffect;
	par[0].stopAfterAnimation = true;
	par[0].destroyTimer = parTargetTimer;
	par[0].hsp = lengthdir_x(spd,angle);
	par[0].vsp = lengthdir_y(spd,angle);
	
	return par;
}
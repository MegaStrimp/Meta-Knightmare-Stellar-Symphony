function scr_MKSS_Enemy_DirTarget(targetObject = obj_Player)
{
	var nearestTarget = instance_nearest(x,y,targetObject);	
	var dir = 1;
	if (nearestTarget.x < x) dir = -1;
	
	return dir;
}
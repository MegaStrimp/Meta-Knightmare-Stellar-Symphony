if (timer == 0)
{
	var arrowDir = (360/arrowAmnt) * arrowsSpawned
	instance_create_depth(x + lengthdir_x(radius,arrowDir),y + lengthdir_y(radius,arrowDir),depth-1,obj_MKSS_Cutscene_StarlessMarxArrowFlurry_Arrow)
	arrowsSpawned++
	if (arrowsSpawned == arrowAmnt)
	{
		attackTimer = 30
		timer = -1
	}
	else
	{
		timer = arrowSpawnTime
	}
	
}
else
{
	timer--
}

if (attackTimer > -1)
{
	attackTimer--
	if (attackTimer == 0)
	{
		with (obj_MKSS_Cutscene_StarlessMarxArrowFlurry_Arrow)
		{
			speed = 4
			sprite_index = spr_MKSS_Attack_StarlessMarx_Arrow2
		}
	}
}
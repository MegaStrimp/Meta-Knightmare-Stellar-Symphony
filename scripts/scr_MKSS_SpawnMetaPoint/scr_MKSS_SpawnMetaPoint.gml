///@description MKSS - Spawn Meta Point

function scr_MKSS_SpawnMetaPoint(targetPoints,targetX,targetY,targetDepth,targetOwner,targetAngle)
{
	var spawnAmountBig = floor(targetPoints / 20);
	var spawnAmountMedium = floor((targetPoints - (spawnAmountBig * 20)) / 5);
	var spawnAmountSmall = targetPoints - (spawnAmountBig * 20) - (spawnAmountMedium * 5);
	var angleRand = 0;
	
	for (var i = 0; i < spawnAmountBig; i++)
	{
		var metaPoint = instance_create_depth(targetX + irandom_range(-6,6),targetY + irandom_range(-6,6),targetDepth,obj_MKSS_MetaPoint);
		metaPoint.points = 20;
		metaPoint.pointSize = 2;
		metaPoint.targetPlayer = targetOwner;
		metaPoint.angle = targetAngle + angleRand;
		
		angleRand = irandom_range(-25,25);
	}
	
	for (var i = 0; i < spawnAmountMedium; i++)
	{
		var metaPoint = instance_create_depth(targetX + irandom_range(-6,6),targetY + irandom_range(-6,6),targetDepth,obj_MKSS_MetaPoint);
		metaPoint.points = 5;
		metaPoint.pointSize = 1;
		metaPoint.targetPlayer = targetOwner;
		metaPoint.angle = targetAngle + angleRand;
		
		angleRand = irandom_range(-25,25);
	}
	
	for (var i = 0; i < spawnAmountSmall; i++)
	{
		var metaPoint = instance_create_depth(targetX + irandom_range(-6,6),targetY + irandom_range(-6,6),targetDepth,obj_MKSS_MetaPoint);
		metaPoint.points = 1;
		metaPoint.pointSize = 0;
		metaPoint.targetPlayer = targetOwner;
		if (targetAngle != -1) metaPoint.angle = targetAngle + angleRand;
		
		angleRand = irandom_range(-25,25);
	}
}
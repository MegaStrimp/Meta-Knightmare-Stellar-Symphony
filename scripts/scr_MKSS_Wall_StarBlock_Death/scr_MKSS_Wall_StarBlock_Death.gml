///@description MKSS - Wall - Star Block - Death

function scr_MKSS_Wall_StarBlock_Death()
{
	if (metaPointsChance != -1)
	{
		var rng = irandom_range(0,metaPointsChance);
		if (rng == 0) scr_MKSS_SpawnMetaPoint(1,x,y,depth,receivedAttackOwner,receivedKnockbackAngle);
	}
}
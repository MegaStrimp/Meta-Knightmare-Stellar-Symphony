///@description MKSS - Enemy - Death

function scr_MKSS_Enemy_Death(targetEnemy)
{
	with (targetEnemy)
	{
		if (deathParticleIndex != -1) script_execute(deathParticleIndex,x,y);
		
		scr_MKSS_Score_Add(points);
		
		instance_destroy();
	}
}
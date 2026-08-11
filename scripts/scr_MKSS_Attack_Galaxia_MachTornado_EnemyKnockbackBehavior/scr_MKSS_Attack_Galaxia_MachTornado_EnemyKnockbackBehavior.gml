///@description MKSS - Attack - Galaxia - Mach Tornado - Enemy Knockback Behavior

function scr_MKSS_Attack_Galaxia_MachTornado_EnemyKnockbackBehavior(targetAttack,targetEnemy)
{
	#region Knockback
	var knockbackAngle = -1;
	
	if (sign(targetAttack.x - targetEnemy.x) == 1)
	{
		knockbackAngle = 45;
	}
	else
	{
		knockbackAngle = 135;
	}
	#endregion
	
	return knockbackAngle;
}
///@description MKSS - Attack - Meta Knight - Slide - Enemy Hit Behavior

function scr_MKSS_Attack_MetaKnight_Slide_EnemyHitBehavior()
{
	#region Cancel Attack
	with (owner)
	{
		attackCooldownTarget = 10;
		
		hsp = -dirX * .4 * speedMultFinal;
		slideAccelTimer = -1;
		slideEndTimer = 0;
	}
	#endregion
}
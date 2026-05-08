///@description MKSS - Attack - Galaxia - Finisher - Enemy Hit Behavior

function scr_MKSS_Attack_Galaxia_Finisher_EnemyHitBehavior()
{
	#region Recoil The Owner
	with (owner)
	{
		hsp = -dirX * 1 * speedMultFinal;
	}
	#endregion
}
///@description MKSS - Attack - Galaxia - Chop - Enemy Hit Behavior

function scr_MKSS_Attack_Galaxia_Chop_EnemyHitBehavior()
{
	#region Recoil The Owner
	with (owner)
	{
		hsp = -dirX * .4 * speedMultFinal;
	}
	#endregion
}
///@description MKSS - Attack - Galaxia - Kick - Enemy Hit Behavior

function scr_MKSS_Attack_Galaxia_Kick_EnemyHitBehavior()
{
	#region Recoil The Owner
	with (owner)
	{
		hsp = -dirX * .4 * speedMultFinal;
	}
	#endregion
}
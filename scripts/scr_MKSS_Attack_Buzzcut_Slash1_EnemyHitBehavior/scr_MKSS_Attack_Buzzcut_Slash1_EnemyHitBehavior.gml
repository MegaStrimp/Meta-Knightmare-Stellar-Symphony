///@description MKSS - Attack - Buzzcut - Slash 1 - Enemy Hit Behavior

function scr_MKSS_Attack_Buzzcut_Slash1_EnemyHitBehavior()
{
	#region Recoil The Owner
	with (owner)
	{
		hsp = -dirX * .4 * speedMultFinal;
	}
	#endregion
}
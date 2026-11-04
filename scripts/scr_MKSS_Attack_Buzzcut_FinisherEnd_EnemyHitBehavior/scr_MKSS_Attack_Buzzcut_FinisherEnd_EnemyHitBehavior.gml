///@description MKSS - Attack - Buzzcut - Finisher End - Enemy Hit Behavior

function scr_MKSS_Attack_Buzzcut_FinisherEnd_EnemyHitBehavior()
{
	#region Recoil The Owner
	with (owner)
	{
		hsp = -dirX * .8 * speedMultFinal;
	}
	#endregion
}
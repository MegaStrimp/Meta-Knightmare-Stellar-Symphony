///@description MKSS - Attack - Ghoul Knight - Stab - End Step

function scr_MKSS_Attack_GhoulKnight_Stab_EndStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "ghoulKnight_Stab"]) instance_destroy();
	#endregion
}
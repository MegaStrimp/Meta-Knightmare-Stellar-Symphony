///@description MKSS - Attack - Ghost Knight - Stab - End Step

function scr_MKSS_Attack_GhostKnight_Stab_EndStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "ghostKnight_Stab"]) instance_destroy();
	#endregion
}
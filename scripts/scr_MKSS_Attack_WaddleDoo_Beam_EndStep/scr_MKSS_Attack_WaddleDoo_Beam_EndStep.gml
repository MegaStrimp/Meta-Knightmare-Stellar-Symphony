///@description MKSS - Attack - Waddle Doo - Beam - End Step

function scr_MKSS_Attack_WaddleDoo_Beam_EndStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "waddleDoo_Beam"]) instance_destroy();
	#endregion
}
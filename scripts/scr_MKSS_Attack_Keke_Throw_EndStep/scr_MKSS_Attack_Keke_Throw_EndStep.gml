///@description MKSS - Attack - Keke - Throw - End Step

function scr_MKSS_Attack_Keke_Throw_EndStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "keke_Throw"]) instance_destroy();
	#endregion
}
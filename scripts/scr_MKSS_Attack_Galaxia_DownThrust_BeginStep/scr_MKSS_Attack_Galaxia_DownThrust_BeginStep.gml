///@description MKSS - Attack - Galaxia - Down Thrust - Begin Step

function scr_MKSS_Attack_Galaxia_DownThrust_BeginStep()
{
	#region Destroy
	if ((owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_DownThrust"]) or (owner.downThrustState != 1)) instance_destroy();
	#endregion
}
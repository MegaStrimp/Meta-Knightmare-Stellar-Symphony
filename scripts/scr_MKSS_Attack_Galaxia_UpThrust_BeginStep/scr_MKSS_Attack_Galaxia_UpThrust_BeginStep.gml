///@description MKSS - Attack - Galaxia - Up Thrust - Begin Step

function scr_MKSS_Attack_Galaxia_UpThrust_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_UpThrust"]) instance_destroy();
	#endregion
}
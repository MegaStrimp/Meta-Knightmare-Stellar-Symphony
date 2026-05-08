///@description MKSS - Attack - Galaxia - Chop - Begin Step

function scr_MKSS_Attack_Galaxia_Chop_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_Chop"]) instance_destroy();
	#endregion
}
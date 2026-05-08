///@description MKSS - Attack - Galaxia - Stab - Begin Step

function scr_MKSS_Attack_Galaxia_Stab_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_Stab"]) instance_destroy();
	#endregion
}
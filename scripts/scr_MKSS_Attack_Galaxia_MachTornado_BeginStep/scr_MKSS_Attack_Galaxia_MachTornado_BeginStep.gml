///@description MKSS - Attack - Galaxia - Mach Tornado - Begin Step

function scr_MKSS_Attack_Galaxia_MachTornado_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_MachTornado"]) instance_destroy();
	#endregion
}
///@description MKSS - Attack - Galaxia - Finisher - Begin Step

function scr_MKSS_Attack_Galaxia_Finisher_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_Finisher"]) instance_destroy();
	#endregion
}
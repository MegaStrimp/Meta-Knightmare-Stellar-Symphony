///@description MKSS - Attack - Galaxia - Circle Slash - Begin Step

function scr_MKSS_Attack_Galaxia_CircleSlash_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_CircleSlash"]) instance_destroy();
	#endregion
}
///@description MKSS - Attack - Galaxia - Kick - Begin Step

function scr_MKSS_Attack_Galaxia_Kick_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "galaxia_Kick"]) instance_destroy();
	#endregion
}
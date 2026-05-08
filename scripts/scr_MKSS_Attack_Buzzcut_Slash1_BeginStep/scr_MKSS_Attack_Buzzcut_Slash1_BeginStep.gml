///@description MKSS - Attack - Buzzcut - Slash1 - Begin Step

function scr_MKSS_Attack_Buzzcut_Slash1_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "buzzcut_Slash1"]) instance_destroy();
	#endregion
}
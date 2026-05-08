///@description MKSS - Attack - Buzzcut - Slash 2 - Begin Step

function scr_MKSS_Attack_Buzzcut_Slash2_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "buzzcut_Slash2"]) instance_destroy();
	#endregion
}
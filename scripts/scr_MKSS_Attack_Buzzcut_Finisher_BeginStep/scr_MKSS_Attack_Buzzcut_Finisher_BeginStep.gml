///@description MKSS - Attack - Buzzcut - Finisher - Begin Step

function scr_MKSS_Attack_Buzzcut_Finisher_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "buzzcut_Finisher"]) instance_destroy();
	#endregion
}
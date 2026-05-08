///@description MKSS - Attack - Meta Knight - Slide - Begin Step

function scr_MKSS_Attack_MetaKnight_Slide_BeginStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "metaKnight_Slide"]) instance_destroy();
	#endregion
}
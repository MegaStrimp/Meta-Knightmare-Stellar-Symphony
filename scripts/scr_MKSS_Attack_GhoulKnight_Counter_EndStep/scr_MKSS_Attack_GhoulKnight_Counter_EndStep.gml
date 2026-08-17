///@description MKSS - Attack - Ghoul Knight - Counter - End Step

function scr_MKSS_Attack_GhoulKnight_Counter_EndStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "ghoulKnight_Counter"]) instance_destroy();
	#endregion
}
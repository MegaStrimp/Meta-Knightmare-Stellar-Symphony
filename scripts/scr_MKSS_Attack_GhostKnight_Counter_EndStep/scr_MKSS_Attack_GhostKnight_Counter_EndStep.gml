///@description MKSS - Attack - Ghost Knight - Counter - End Step

function scr_MKSS_Attack_GhostKnight_Counter_EndStep()
{
	#region Destroy
	if (owner.attackIndex != global.MKSS_AttackIDs[? "ghostKnight_Counter"]) instance_destroy();
	#endregion
}
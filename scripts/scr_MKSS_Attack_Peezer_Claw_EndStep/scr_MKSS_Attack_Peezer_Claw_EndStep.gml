///@description MKSS - Attack - Peezer - Claw - End Step

function scr_MKSS_Attack_Peezer_Claw_EndStep()
{
	#region Destroy
	if ((!instance_exists(owner)) or (owner.attackState != 2)) instance_destroy();
	#endregion
}
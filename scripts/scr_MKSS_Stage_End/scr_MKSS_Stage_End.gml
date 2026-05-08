///@description MKSS - Stage - End

function scr_MKSS_Stage_End()
{
	#region Event Inherited
	scr_Stage_End();
	#endregion
	
	#region Variables
	global.MKSS_StageHasScore = true;
	#endregion
	
	#region Reset Medal
	scr_MKSS_Hud_Medal_Reset();
	#endregion
	
	#region Destroy Objects
	with (obj_MKSS_OceanAmbience) instance_destroy();
	#endregion
}
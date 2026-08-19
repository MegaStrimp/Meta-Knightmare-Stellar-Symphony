///@description Begin Step

#region Event Inherited
event_inherited();
#endregion

#region Play Cutscene
if (cutsceneCheck)
{
	if (global.MKSS_BarrierIndex != global.MKSS_BarrierIndexTarget)
	{
		if (global.MKSS_BarrierIndex < 2) //STRIMPTODO For the demo
		{
			with (instance_create_depth(0,0,0,obj_MKSS_Cutscene))
			{
				scr_MKSS_Cutscene_Preset_HalberdBarrier();
			}
		}
	}
	
	cutsceneCheck = true;
}
#endregion
///@description Main

#region Activate With Switch
with (obj_MKSS_Switch)
{
	if ((switchNetworkNum == other.switchNetworkNum) and (flag_SwitchActive)) other.hp = 0;
}
#endregion

#region Event Inherited
event_inherited();
#endregion
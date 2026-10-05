///@description Room Creation Code

if (!global.MKSS_UpgradeList[global.MKSS_UpgradeIDs[? "Base_Parry"]].isUnlocked)
{
	#region Room Setup
	script_execute(scr_MKSS_RoomSetup_IceCreamIsland);
	#endregion
}
else
{
	#region Turn Afternoon
	scr_Stage_IceCreamIsland_TurnAfternoon();
	#endregion
}
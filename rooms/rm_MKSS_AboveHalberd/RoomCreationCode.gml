///@description Room Creation Code

#region Begin Stage
if (global.roomPrevious != room) scr_MKSS_Stage_Begin("aboveHalberd");
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_RoyalReeve);
#endregion

#region Room Setup
script_execute(scr_MKSS_RoomSetup_AboveHalberd);
#endregion
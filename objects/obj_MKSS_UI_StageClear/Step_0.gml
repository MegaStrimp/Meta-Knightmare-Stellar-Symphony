///@description Main

#region Selection
var canSelect = true;
if (targetRoom != -1) canSelect = false;

if (canSelect)
{
	if (input_check_pressed("B",playerNum))
	{
		scr_PlaySfx(snd_MKSS_ButtonNo);
		
		with (obj_Player) stageClear_StateTimer = 0;
		
		targetRoom = rm_MKSS_BattleshipHalberd;
		
		nextRoomTimer = nextRoomTimerMax;
	}
}
#endregion

#region Circle
circleR = lerp(circleR,48,.1);
#endregion

#region Title Offset
titleOffset = lerp(titleOffset,0,.1);
#endregion

#region Hint Offset
hintOffset = lerp(hintOffset,32 * (hintOffsetTimer != -1),.1);
#endregion

#region Hint Offset Timer
if (hintOffsetTimer != -1)
{
	hintOffsetTimer = max(hintOffsetTimer - speedMultFinal,0);
	if (hintOffsetTimer == 0)
	{
		hintOffsetTimer = -1;
	}
}
#endregion

#region Next Room Timer
if (nextRoomTimer != -1)
{
	nextRoomTimer = max(nextRoomTimer - speedMultFinal,0);
	if (nextRoomTimer == 0)
	{
		scr_PlaySfx(snd_MKSS_NextScene);
		
		scr_MKSS_SaveData(global.selectedSave);
		
		with (scr_GoToRoom(targetRoom,false)) alphaSpd = (alphaSpd / 2);
		
		nextRoomTimer = -1;
	}
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
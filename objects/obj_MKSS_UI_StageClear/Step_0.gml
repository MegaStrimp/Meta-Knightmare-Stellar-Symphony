///@description Main

#region Selection
var canSelect = true;
if ((hintOffsetTimer == -1)
and (scoreBonusTimer == -1)
and (targetRoom != -1)) canSelect = false;

if (canSelect)
{
	if (input_check_pressed("B",playerNum))
	{
		var sfx = scr_PlaySfx(snd_MKSS_ButtonNo);
		//audio_sound_pitch(sfx,random_range(.85,1.15));
		
		global.canGamePause = true;
		
		with (obj_Player) stageClear_StateTimer = 0;
		
		targetRoom = rm_MKSS_BattleshipHalberd;
		
		nextRoomTimer = nextRoomTimerMax;
	}
	
	if ((targetRoom_Retry != -1) and (input_check_pressed("X",playerNum)))
	{
		var sfx = scr_PlaySfx(snd_MKSS_NextScene);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		global.canGamePause = true;
		
		with (obj_Player) stageClear_StateTimer = 0;
		
		targetRoom = targetRoom_Retry;
		
		nextRoomTimer = nextRoomTimerMax;
	}
	
	if ((targetRoom_Next != -1) and (input_check_pressed("A",playerNum)))
	{
		var sfx = scr_PlaySfx(snd_MKSS_NextScene);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		global.canGamePause = true;
		
		with (obj_Player) stageClear_StateTimer = 0;
		
		targetRoom = targetRoom_Next;
		
		nextRoomTimer = nextRoomTimerMax;
	}
}
#endregion

#region Circle
var circleWave = sine_wave(current_time / 2000,4,.1,0);

circleR = lerp(circleR,48 + circleWave,.1);
#endregion

#region Title Offset
titleOffset = lerp(titleOffset,0,.1);
#endregion

#region Hint Offset
hintOffset = lerp(hintOffset,32 * ((hintOffsetTimer != -1) or (scoreBonusTimer != -1)),.1);
#endregion

#region Hint Offset Timer
if (hintOffsetTimer != -1)
{
	hintOffsetTimer = max(hintOffsetTimer - speedMultFinal,0);
	if (hintOffsetTimer == 0)
	{
		if (!ds_list_empty(scoreBonuses)) scoreBonusTimer = 0;
		
		hintOffsetTimer = -1;
	}
}
#endregion

#region Score Bonus Timer
if (scoreBonusTimer != -1)
{
	scoreBonusTimer = max(scoreBonusTimer - speedMultFinal,0);
	if (scoreBonusTimer == 0)
	{
		var sfx = scr_PlaySfx(snd_MKSS_MetaPointCollect3);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		var currentScoreBonus = ds_list_find_value(scoreBonuses,0);
		
		with (instance_create_depth(0,0,depth - 1,obj_MKSS_UI_ScoreBonus))
		{
			sprite_index = global.MKSS_ScoreBonusList[currentScoreBonus].sprite;
			destroyTimer = other.scoreBonusTimerMax - 15;
		}
		
		with (obj_FrameworkControl) metaPointCollectTimer = metaPointCollectTimerMax;
		global.MKSS_PlayerMetaPoints[playerNum] = min(global.MKSS_PlayerMetaPoints[playerNum] + global.MKSS_ScoreBonusList[currentScoreBonus].metaPointCount,9999);
		
		ds_list_delete(scoreBonuses,0);
		
		if (ds_list_empty(scoreBonuses))
		{
			scoreBonusTimer = -1;
		}
		else
		{
			scoreBonusTimer = scoreBonusTimerMax;
		}
	}
}
#endregion

#region Next Room Timer
if (nextRoomTimer != -1)
{
	nextRoomTimer = max(nextRoomTimer - speedMultFinal,0);
	if (nextRoomTimer == 0)
	{
		var sfx = scr_PlaySfx(snd_MKSS_DoorEnter);
		//audio_sound_pitch(sfx,random_range(.85,1.15));
		
		scr_MKSS_Stage_End();
		
		with (scr_GoToRoom(targetRoom,false)) alphaSpd = (alphaSpd / 3);
		
		nextRoomTimer = -1;
	}
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
/// @description Main

if (!localPause)
{
	#region Check If Dialogue Ended
	if (flag_DialogueEnded)
	{
		if (dialogueEndScript != -1) script_execute(dialogueEndScript);
		isActive = false;
		
		flag_DialogueEnded = false;
	}
	#endregion
	
	if ((!isActive) and (targetDialogueMappedID != -1))
	{
		#region Variables
		playerIsNear = false;
		#endregion
		
		#region Player Is Near
		with (obj_Player)
		{
			if (distance_to_object(other) <= 12) other.playerIsNear = true;
			
			if ((other.playerIsNear) and (input_check("up",playerNum)))
			{
				scr_PlaySfx(snd_MKSS_ButtonYes);
				
				other.playerNum = playerNum;
				other.isActive = true;
				other.playerIsNear = false;
				
				scr_Player_CancelAttack(id,attackIndex);
				
				scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Normal_Step);
				
				scr_MKSS_Dialogue_Create(other.targetDialogueMappedID,,other,true,true,true);
			}
		}
		#endregion
	}
}

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
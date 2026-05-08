///@description Main

if (!localPause)
{
	#region Variables
	dialogueIsFlowing = (typist.get_state() < 1);
	var flag_NextDialogue = false;
	#endregion
	
	#region Unpause
	if (typist.get_paused()) typist.unpause();
	#endregion
	
	#region Variables
	typist.sound(textSound,40,.85,1.15,1);
	
	if ((input_check_pressed("A",playerNum)) or (mouse_check_button_pressed(mb_left)))
	{
		if (!dialogueIsFlowing)
		{
		     flag_NextDialogue = true;
		}
		else
		{
			typist.skip();
		}
	}
	#endregion
	
	#region Next Dialogue
	if (flag_NextDialogue)
	{
		if (dialogueIndex >= dialogueLength - 1)
		{
			if (owner != -1)
			{
				with (owner)
				{
					flag_DialogueEnded = true;
				}
			}
			
			instance_destroy();
		}
		else
		{
			dialogueIndex += 1;
			
			portrait_Idle = localDialogue.dialogue[dialogueIndex].portrait_Idle;
			text = localDialogue.dialogue[dialogueIndex].text;
			textSpeed = localDialogue.dialogue[dialogueIndex].textSpeed;
			textSound = localDialogue.dialogue[dialogueIndex].textSound;
		}
		
		flag_NextDialogue = false;
	}
	#endregion
	
	#region Portrait
	if (currentPortrait != undefined)
	{
		if (currentPortrait != portrait_Talk) portraitImageIndex = (portraitImageIndex + (sprite_get_speed(currentPortrait) / 60) + sprite_get_number(currentPortrait)) % sprite_get_number(currentPortrait);
		
		if (dialogueIsFlowing)
		{
			if (portraitTalkTimer == -1) portraitTalkTimer = portraitTalkTimerMax;
			
			#region Portrait Talk Timer
			if (portraitTalkTimer != -1)
			{
				portraitTalkTimer = max(portraitTalkTimer - speedMultFinal,0);
				if (portraitTalkTimer == 0)
				{
					if (currentPortrait == portrait_Talk)
					{
						currentPortrait = portrait_Idle;
					}
					else
					{
						currentPortrait = portrait_Talk;
					}
					
					portraitTalkTimer = -1;
				}
			}
			#endregion
		}
		else
		{
			portraitTalkTimer = -1;
			
			currentPortrait = portrait_Idle;
		}
	}
	#endregion
}
else
{
	#region Pause
	if (!typist.get_paused()) typist.pause();
	#endregion
}

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
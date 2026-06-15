///@description Main

if (!localPause)
{
	#region Reset Animation
	if (flag_DialogueEnded)
	{
		sprite_index = spr_MKSS_NPC_OilWheelie_Idle;
		image_index = 0;
		
		spriteTimer = spriteTimerMax;
	}
	#endregion
}

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	if (isActive)
	{
		#region Animation
		sprite_index = talkSprite;
		#endregion
	}
	else
	{
		#region Sprite Timer
		if (spriteTimer != -1)
		{
			spriteTimer = max(spriteTimer - speedMultFinal,0);
			if (spriteTimer == 0)
			{
				switch (sprite_index)
				{
					case spr_MKSS_NPC_OilWheelie_Idle:
					sprite_index = spr_MKSS_NPC_OilWheelie_DrinkStart;
					image_index = 0;
					break;
				
					case spr_MKSS_NPC_OilWheelie_Drink:
					sprite_index = spr_MKSS_NPC_OilWheelie_DrinkEnd;
					image_index = 0;
					break;
				}
			
				spriteTimer = -1;
			}
		}
		#endregion
	}
}
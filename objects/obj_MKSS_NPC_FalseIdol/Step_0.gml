///@description Main

if (!localPause)
{
	#region Reset Animation
	if (flag_DialogueEnded)
	{
		talkSprite = spr_MKSS_NPC_FalseIdol_Talk;
		
		sprite_index = spr_MKSS_NPC_FalseIdol_Idle;
		image_index = 0;
	}
	#endregion
}

#region Event Inherited
event_inherited();
#endregion

if (!localPause)
{
	#region Animation
	if (isActive)
	{
		sprite_index = talkSprite;
	}
	else
	{
		sprite_index = spr_MKSS_NPC_FalseIdol_Idle;
	}
}
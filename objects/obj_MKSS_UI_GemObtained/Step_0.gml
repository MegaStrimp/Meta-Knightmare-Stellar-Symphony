///@description Main

#region Selection
var canSelect = true;
if ((hintOffsetTimer != -1) or (endTimer != -1) or (destroyTimer != -1)) canSelect = false;

if (canSelect)
{
	if (input_check_pressed("A",playerNum))
	{
		var sfx = scr_PlaySfx(snd_MKSS_ButtonYes);
		//audio_sound_pitch(sfx,random_range(.85,1.15));
		
		endTimer = 0;
	}
}
#endregion

#region Alpha
alpha = lerp(alpha,alphaTarget,.2);
#endregion

#region Decals
decalLength = lerp(decalLength,decalLengthTarget,.1);
#endregion

#region Text
textOffset = lerp(textOffset,textOffsetTarget,.1);
#endregion

#region Gem Animation
gemIndex = (gemIndex + gemSpeed) % gemNumber;
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

#region End Timer
if (endTimer != -1)
{
	endTimer = max(endTimer - speedMultFinal,0);
	if (endTimer == 0)
	{
		global.canGamePause = true;
		
		alphaTarget = 0;
		decalLengthTarget = -50;
		textOffsetTarget = -global.gameWidth;
		destroyTimer = 30;
		
		endTimer = -1;
	}
}
#endregion

#region Destroy Timer
if (destroyTimer != -1)
{
	destroyTimer = max(destroyTimer - speedMultFinal,0);
	if (destroyTimer == 0)
	{
		scr_MKSS_ObtainNotif(global.MKSS_NotifIDs[? "concentratedGemTutorial"]);
		
		instance_destroy();
		
		destroyTimer = -1;
	}
}
#endregion

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
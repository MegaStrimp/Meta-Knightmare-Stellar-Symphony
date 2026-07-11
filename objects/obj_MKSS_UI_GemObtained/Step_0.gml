///@description Main

#region Selection
var canSelect = true;
if (targetRoom != -1) canSelect = false;

if (canSelect)
{
	if (input_check_pressed("A",playerNum))
	{
		scr_PlaySfx(snd_MKSS_ButtonYes);
		
		scr_MKSS_ObtainNotif(global.MKSS_NotifIDs[? "concentratedGemTutorial"]);
		
		instance_destroy();
	}
}
#endregion

#region Alpha
alpha = lerp(alpha,1,.2);
#endregion

#region Decals
decalLength = lerp(decalLength,decalLengthTarget,.1);
#endregion

#region Can Select Timer
if (canSelectTimer != -1)
{
	canSelectTimer = max(canSelectTimer - speedMultFinal,0);
	if (canSelectTimer == 0)
	{
		canSelectTimer = -1;
	}
}
#endregion
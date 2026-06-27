///@description Main

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
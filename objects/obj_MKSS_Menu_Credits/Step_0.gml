///@description Main

if (!global.pauseFinal)
{
	#region Scroll Timer
	if (scrollTimer != -1)
	{
		scrollTimer = max(scrollTimer - speedMultFinal,0);
		if (scrollTimer == 0)
		{
			yScroll -= 1;
			scrollTimer = 2;
		}
	}
	#endregion
}
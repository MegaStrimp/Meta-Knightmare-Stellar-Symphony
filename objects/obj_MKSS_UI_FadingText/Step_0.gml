///@description Main

if (!localPause)
{
	#region Alpha
	alpha = lerp(alpha,alphaTarget,.2);
	
	if ((alphaTarget == 0) and (alpha == 0)) instance_destroy();
	#endregion
	
	#region Disappear Timer
	if (disappearTimer != -1)
	{
		disappearTimer = max(disappearTimer - speedMultFinal,0);
		if (disappearTimer == 0)
		{
			alphaTarget = 0;
			
			disappearTimer = -1;
		}
	}
	#endregion
}
///@description Main

if (!localPause)
{
	#region Alpha
	if (alphaTimer == -1) alpha -= .02 * speedMultFinal;
	if (alpha <= 0) instance_destroy();
	
	image_alpha = alpha;
	#endregion
	
	#region Alpha Timer
	if (alphaTimer != -1)
	{
		alphaTimer = max(alphaTimer - speedMultFinal,0);
		if (alphaTimer == 0)
		{
			alphaTimer = -1;
		}
	}
	#endregion
}
///@description Main

if (active)
{
	#region Alpha Timer
	if (alphaTimer != -1)
	{
		alphaTimer = max(alphaTimer - 1,0);
		if (alphaTimer == 0)
		{
			scr_PlaySfx(snd_MKSS_SecretDisappear);
			alphaTarget = -1;
			alphaTimer = -1;
		}
	}
	#endregion
	
	#region Alpha & Animation
	image_speed = active;
	
	image_alpha = clamp(image_alpha + (alphaTarget * .02),0,1);
	if (image_alpha == 0) instance_destroy();
	#endregion
}
else
{
	
	#region Activate
	image_speed = 0;
	
	if ((alphaTarget == 1) and (distance_to_object(obj_Player) <= 36))
	{
		active = true;
		scr_PlaySfx(snd_MKSS_SoupSandwich);
	}
	#endregion
}
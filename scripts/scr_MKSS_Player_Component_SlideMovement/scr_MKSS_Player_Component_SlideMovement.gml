///@description MKSS - Player - Component - Slide Movement

function scr_MKSS_Player_Component_SlideMovement(targetMovespeed = movespeedSlide,targetDecel = decel)
{
	#region Movement
	if (slideAccelTimer != -1) hsp = targetMovespeed * dirX * speedMultFinal;
	#endregion
	
	#region Decelerate
	var decelFinal = targetDecel * speedMultFinal;
	
	hsp = scr_Entity_Friction(hsp,decelFinal);
	#endregion
	
	#region Speed Limit
	var hasSpeedLimit = true;
	
	if (hasSpeedLimit)
	{
		var maxMovespeed = targetMovespeed * speedMultFinal;
		hsp = clamp(hsp,-maxMovespeed,maxMovespeed);
	}
	#endregion
}
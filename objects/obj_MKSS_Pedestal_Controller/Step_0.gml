///@description Main

if (!localPause)
{
	#region Player Camera Y Offset
	var pedestalActive = false;
	
	with (obj_MKSS_Pedestal)
	{
		if (isActive)
		{
			pedestalActive = true;
			break;
		}
	}
	
	with (obj_Player)
	{
		if (playerNum == 0)
		{
			cameraYOffset = lerp(cameraYOffset,pedestalActive * -36,.05);
		}
	}
	#endregion
}
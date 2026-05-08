///@description MKSS - Player - Component - Slide Go Back

function scr_MKSS_Player_Component_SlideGoBack(targetState)
{
	#region Go Back
	if (hurtState == hurtStates.hurt)
	{
		scr_Player_ChangePlayerState_Step(id,targetState);
	}
	#endregion
}
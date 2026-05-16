///@description MKSS - Player - Component - Duck Go Back

function scr_MKSS_Player_Component_DuckGoBack(targetState)
{
	#region Go Back
	if ((!place_meeting(x,y - 1,obj_Wall)) and ((!input_check("down",playerNum)) or (input_check("up",playerNum)) or (!grounded) or (hurtState == hurtStates.hurt)))
	{
		isDucking = false;
		
		scr_Player_ChangePlayerState_Step(id,targetState);
	}
	#endregion
}
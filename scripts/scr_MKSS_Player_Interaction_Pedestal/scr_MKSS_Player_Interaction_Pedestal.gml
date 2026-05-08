///@description MKSS - Player - Interaction - Pedestal

function scr_MKSS_Player_Interaction_Pedestal()
{
	with (obj_MKSS_Pedestal)
	{
		if (place_meeting(x,y - 1,other))
		{
			promptIcon = global.UI_IconBindings[? string(input_binding_get("up",other.playerNum))];
			
			if (input_check("up",other.playerNum))
			{
				targetPlayer = other;
				if (activationScript != -1) script_execute(activationScript);
			}
		}
	}
}
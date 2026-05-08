///@description Discord - Init

function scr_Discord_Init(appID)
{
	#region Initialize Discord Rich Presence
	global.discord = true;
	
	if (!np_initdiscord(appID,true,np_steam_app_id_empty))
	{
		global.discord = false;
		
		Error_msg = "Discord RPC unable to initialize";
	}
	#endregion
}
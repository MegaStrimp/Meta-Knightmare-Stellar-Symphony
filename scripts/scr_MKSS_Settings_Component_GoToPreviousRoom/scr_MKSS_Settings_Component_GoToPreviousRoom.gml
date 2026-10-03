///@description MKSS - Settings - Component - Go To Previous Room

function scr_MKSS_Settings_Component_GoToPreviousRoom()
{
	scr_MKSS_SaveConfig("config.ini");
	
	scr_GoToRoom(global.roomPrevious,false);
}
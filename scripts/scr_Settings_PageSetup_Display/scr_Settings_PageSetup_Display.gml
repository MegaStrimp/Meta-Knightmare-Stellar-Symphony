///@description Settings - Page Setup - Display

function scr_Settings_PageSetup_Display()
{
	ds_list_clear(currentList);
	
	ds_list_add(currentList,global.settingsIDs[? "fullscreen"]);
	ds_list_add(currentList,global.settingsIDs[? "windowSize"]);
}
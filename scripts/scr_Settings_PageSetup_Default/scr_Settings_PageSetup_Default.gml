///@description Settings - Page Setup - Default

function scr_Settings_PageSetup_Default()
{
	ds_list_clear(currentList);
	
	ds_list_add(currentList,global.settingsIDs[? "display"]);
	ds_list_add(currentList,global.settingsIDs[? "audio"]);
	ds_list_add(currentList,global.settingsIDs[? "controls"]);
}
///@description Settings - Page Setup - Audio

function scr_Settings_PageSetup_Audio()
{
	ds_list_clear(currentList);
	
	ds_list_add(currentList,global.settingsIDs[? "music"]);
	ds_list_add(currentList,global.settingsIDs[? "sfx"]);
}
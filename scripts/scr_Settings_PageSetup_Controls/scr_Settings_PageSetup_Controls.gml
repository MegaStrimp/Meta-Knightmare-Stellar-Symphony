///@description Settings - Page Setup - Controls

function scr_Settings_PageSetup_Controls()
{
	ds_list_clear(currentList);
	
	ds_list_add(currentList,global.settingsIDs[? "remapUp"]);
	ds_list_add(currentList,global.settingsIDs[? "remapDown"]);
	ds_list_add(currentList,global.settingsIDs[? "remapLeft"]);
	ds_list_add(currentList,global.settingsIDs[? "remapRight"]);
	ds_list_add(currentList,global.settingsIDs[? "remapA"]);
	ds_list_add(currentList,global.settingsIDs[? "remapB"]);
	ds_list_add(currentList,global.settingsIDs[? "remapX"]);
	ds_list_add(currentList,global.settingsIDs[? "remapY"]);
	ds_list_add(currentList,global.settingsIDs[? "remapL"]);
	ds_list_add(currentList,global.settingsIDs[? "remapR"]);
	ds_list_add(currentList,global.settingsIDs[? "remapLT"]);
	ds_list_add(currentList,global.settingsIDs[? "remapRT"]);
	ds_list_add(currentList,global.settingsIDs[? "remapStart"]);
	ds_list_add(currentList,global.settingsIDs[? "remapSelect"]);
	ds_list_add(currentList,global.settingsIDs[? "remapReset"]);
}
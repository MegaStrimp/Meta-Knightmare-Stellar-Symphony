///@description MKSS - Familiar Changer - Set Familiar List

function scr_MKSS_FamiliarChanger_SetFamiliarList()
{
	#region Setup
	familiarListCount = 0;
	hiddenFamiliarCount = 0;
	
	ds_list_clear(familiarList);
	#endregion
	
	for (var i = 0; i < ds_map_size(global.MKSS_FamiliarIDs); i++)
	{
		var currentFamiliar = global.MKSS_FamiliarList[i];
		
		if (currentFamiliar.isHidden) hiddenFamiliarCount += 1;
		
		if (currentFamiliar.isUnlocked)
		{
			ds_list_add(familiarList,i);
			
			if (global.MKSS_PlayerFamiliar[playerNum] == i)
			{
				selection = familiarListCount;
				
				var currentID = ds_list_find_value(familiarList,selection);
				
				currentName = global.MKSS_FamiliarList[currentID].name;
				currentSprite = global.MKSS_FamiliarList[currentID].sprite;
			}
			
			familiarListCount += 1;
		}
	}
	
	isCompleted = ((familiarListCount - hiddenFamiliarCount) == (ds_map_size(global.MKSS_FamiliarIDs) - global.MKSS_HiddenFamiliarCount));
}
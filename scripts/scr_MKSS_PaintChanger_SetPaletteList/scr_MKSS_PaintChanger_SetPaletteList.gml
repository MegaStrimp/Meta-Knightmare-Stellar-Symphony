///@description MKSS - Paint Changer - Set Palette List

function scr_MKSS_PaintChanger_SetPaletteList()
{
	#region Setup
	paletteListCount = 0;
	
	ds_list_clear(paletteList);
	#endregion
	
	for (var i = 0; i < ds_map_size(global.MKSS_SprayPaintIDs); i++)
	{
		var currentPal = global.MKSS_SprayPaintList[i];
		
		if (currentPal.isUnlocked)
		{
			ds_list_add(paletteList,i);
			
			if (global.playerSprayPaint[playerNum] == i)
			{
				selection = paletteListCount;
				
				var currentID = ds_list_find_value(paletteList,selection);
				
				currentName = global.MKSS_SprayPaintList[currentID].name;
				currentSprite = global.MKSS_SprayPaintList[currentID].sprite;
			}
			
			paletteListCount += 1;
		}
	}
	
	isCompleted = (paletteListCount == ds_map_size(global.MKSS_SprayPaintIDs));
}
///@description MKSS - Border Art - Change

function scr_MKSS_BorderArt_Change(targetMappedID)
{
	var targetSprite = global.MKSS_BorderArtList[targetMappedID].sprite;
	
	switch (targetSprite)
	{
		case MKSS_BorderArtSettings.dynamic:
		global.borderArt_Sprite = global.MKSS_BorderArtList[global.MKSS_BorderArt_CurrentDynamicID].sprite;
		break;
		
		case MKSS_BorderArtSettings.randomized:
		var borderArtListTemp = ds_list_create();
		
		for (var i = 3; i < global.MKSS_BorderArtCount - 1; i++)
		{
			ds_list_add(borderArtListTemp,global.MKSS_BorderArtList[i].sprite);
		}
		global.borderArt_Sprite = ds_list_find_value(borderArtListTemp,irandom_range(0,ds_list_size(borderArtListTemp) - 1));
		
		ds_list_destroy(borderArtListTemp);
		break;
		
		case MKSS_BorderArtSettings.none:
		global.borderArt_Sprite = -1;
		break;
		
		default:
		global.borderArt_Sprite = targetSprite;
		break;
	}
	
}
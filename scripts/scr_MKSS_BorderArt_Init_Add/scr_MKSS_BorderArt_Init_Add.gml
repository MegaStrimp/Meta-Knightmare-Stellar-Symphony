///@description MKSS - Border Art - Init - Add

function scr_MKSS_BorderArt_Init_Add(targetID,targetName,targetSprite = MKSS_BorderArtSettings.none)
{
	ds_map_add(global.MKSS_BorderArtIDs,targetID,global.MKSS_BorderArtCount);
	
	global.MKSS_BorderArtList[global.MKSS_BorderArtCount] = 
	{
        ID: targetID,
		name: targetName,
		sprite: targetSprite,
		
		isUnlocked: false,
		isDefault: false
    };
	
	global.MKSS_BorderArtCount += 1;
}
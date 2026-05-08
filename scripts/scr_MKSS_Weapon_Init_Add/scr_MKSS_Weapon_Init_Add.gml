///@description MKSS - Weapon - Init - Add

function scr_MKSS_Weapon_Init_Add(targetID,targetName = "",targetSetupScript = undefined,targetBaseScript = undefined,targetHudIcon = undefined,targetHudIconSmall = undefined)
{
	var targetMappedID = ds_map_size(global.MKSS_WeaponIDs);
	ds_map_add(global.MKSS_WeaponIDs,targetID,targetMappedID);
	
	global.MKSS_WeaponList[global.MKSS_WeaponIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		setupScript: targetSetupScript,
		baseScript: targetBaseScript,
		hudIcon: targetHudIcon,
		hudIconSmall: targetHudIconSmall,
		
		isUnlocked: false
    };
	
	return targetMappedID;
}
///@description MKSS - UI - Button - Init - Add

function scr_MKSS_UI_Button_Init_Add(targetID,targetSprite,targetSetupScript = undefined,targetTriggerScript = undefined,targetBaseScript = undefined,targetDrawScript = undefined)
{
	var targetMappedID = ds_map_size(global.MKSS_ButtonIDs);
	ds_map_add(global.MKSS_ButtonIDs,targetID,targetMappedID);
	
	global.MKSS_ButtonList[global.MKSS_ButtonIDs[? targetID]] = 
	{
        ID: targetID,
        sprite: targetSprite,
        setupScript: targetSetupScript,
        triggerScript: targetTriggerScript,
        baseScript: targetBaseScript,
        drawScript: targetDrawScript
    };
	
	return targetMappedID;
}
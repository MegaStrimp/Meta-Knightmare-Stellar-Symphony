///@description Settings - Init - Add

function scr_Settings_Init_Add(targetID,targetTitle = "",targetSetupScript = undefined,targetSetupScriptArgs = [],targetSelectAction = undefined,targetSelectActionArgs = [],targetBackAction = undefined,targetBackActionArgs = [],targetUpAction = undefined,targetUpActionArgs = [],targetDownAction = undefined,targetDownActionArgs = [],targetLeftAction = undefined,targetLeftActionArgs = [],targetRightAction = undefined,targetRightActionArgs = [],targetDrawScript = undefined,targetDrawScriptArgs = [])
{
	var targetMappedID = ds_map_size(global.settingsIDs);
	ds_map_add(global.settingsIDs,targetID,targetMappedID);
	
	global.settingsList[global.settingsIDs[? targetID]] = 
	{
        ID: targetID,
		title: targetTitle,
		setupScript: targetSetupScript,
		setupScriptArgs: targetSetupScriptArgs,
		selectAction: targetSelectAction,
		selectActionArgs: targetSelectActionArgs,
		backAction: targetBackAction,
		backActionArgs: targetBackActionArgs,
		upAction: targetUpAction,
		upActionArgs: targetUpActionArgs,
		downAction: targetDownAction,
		downActionArgs: targetDownActionArgs,
		leftAction: targetLeftAction,
		leftActionArgs: targetLeftActionArgs,
		rightAction: targetRightAction,
		rightActionArgs: targetRightActionArgs,
		drawScript: targetDrawScript,
		drawScriptArgs: targetDrawScriptArgs
    };
	
	return targetMappedID;
}
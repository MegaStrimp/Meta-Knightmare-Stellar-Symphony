///@description MKSS - UI - Notif - Init - Add

function scr_MKSS_UI_Notif_Init_Add(targetID,targetText,targetUnlockScript,targetIsSavable,targetImage = [undefined],targetXScale = 3,targetYScale = 2)
{
	ds_map_add(global.MKSS_NotifIDs,targetID,ds_map_size(global.MKSS_NotifIDs));
	
	global.MKSS_NotifList[global.MKSS_NotifIDs[? targetID]] = 
	{
        id: targetID,
        text: targetText,
        image: targetImage,
		unlockScript: targetUnlockScript,
		isSavable: targetIsSavable,
		xScale: targetXScale,
		yScale: targetYScale,
		nextText: "Next",
		nextScript: undefined,
		backText: undefined,
		backScript: undefined,
		inputDelayTimer: -1,
		isObtained: false
    };
}
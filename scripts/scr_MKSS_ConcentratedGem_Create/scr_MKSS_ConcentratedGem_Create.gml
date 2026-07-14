///@description MKSS - Concentrated Gem - Create

function scr_MKSS_ConcentratedGem_Create(gemTargetStageID = -1,gemTargetUnlockedStageID = -1,gemTargetCollectibleID = -1,targetGemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue,targetGemTitle = "", targetUnlockTitle = "")
{
	//STRIMPTODO Make it so the gems fly to a target position like after killing a Sphere Doomer
	
	with (instance_create_layer(targetX,targetY,"Environment",obj_MKSS_ConcentratedGem))
	{
		targetStageID = gemTargetStageID;
		targetUnlockedStageID = gemTargetUnlockedStageID;
		targetCollectibleID = gemTargetCollectibleID;
		
		gemPalette = targetGemPalette;
		
		gemTitle = targetGemTitle;
		unlockTitle = targetUnlockTitle;
	}
}
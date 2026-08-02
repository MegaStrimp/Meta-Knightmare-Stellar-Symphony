///@description MKSS - Concentrated Gem - Create

function scr_MKSS_ConcentratedGem_Create(targetX,targetY,gemTargetStageID = -1,gemTargetUnlockedStageID = -1,gemTargetCollectibleID = -1,targetGemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Blue,targetGemTitle = "", targetUnlockTitle = "")
{
	//STRIMPTODO Make it so the gems fly to a target position like after killing a Sphere Doomer
	
	with (instance_create_layer(targetX,targetY,"Environment",obj_MKSS_ConcentratedGem))
	{
		targetStageID = gemTargetStageID;
		targetUnlockedStageID = gemTargetUnlockedStageID;
		targetCollectibleID = gemTargetCollectibleID;
		
		gemPalette = targetGemPalette;
		
		switch (gemPalette)
		{
			case spr_MKSS_UI_GemObtained_Gem_Palette_Red:
			crackSprite = spr_MKSS_ConcentratedGem_Crack_Red;
			break;
			
			case spr_MKSS_UI_GemObtained_Gem_Palette_BlueEX:
			crackSprite = spr_MKSS_ConcentratedGem_Crack_BlueEX;
			break;
			
			case spr_MKSS_UI_GemObtained_Gem_Palette_RedEX:
			crackSprite = spr_MKSS_ConcentratedGem_Crack_RedEX;
			break;
		}
		
		gemTitle = targetGemTitle;
		unlockTitle = targetUnlockTitle;
	}
}
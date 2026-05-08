///@description MKSS - UI - Stage Intro - Create

function scr_MKSS_UI_StageIntro_Create(targetStageTitleSprite,targetDecalPalette = -1)
{
	with (instance_create_depth(0,0,0,obj_MKSS_UI_StageIntro))
	{
		stageTitleSprite = targetStageTitleSprite;
		decalPalette = targetDecalPalette;
	}
}
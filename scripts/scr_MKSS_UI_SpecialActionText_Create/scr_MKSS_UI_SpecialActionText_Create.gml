///@description MKSS - UI - Special Action Text - Create

function scr_MKSS_UI_SpecialActionText_Create(targetSprite,targetX = x,targetY = y,targetDepth = depth - 1)
{
	with (instance_create_depth(targetX,targetY,targetDepth,obj_MKSS_UI_SpecialActionText))
	{
		sprite_index = targetSprite;
	}
}
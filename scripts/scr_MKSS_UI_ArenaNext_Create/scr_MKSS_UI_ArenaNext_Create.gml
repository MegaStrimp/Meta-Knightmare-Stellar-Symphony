///@description MKSS - UI - Arena Next - Create

function scr_MKSS_UI_ArenaNext_Create(targetIcon = -1,targetTitle = -1,targetToGo = -1)
{
	with (obj_MKSS_UI_ArenaNext) instance_destroy();
	
	with (instance_create_depth(0,0,0,obj_MKSS_UI_ArenaNext))
	{
		icon = targetIcon;
		title = targetTitle;
		toGo = targetToGo;
	}
}
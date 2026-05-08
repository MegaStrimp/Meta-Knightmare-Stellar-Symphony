///@description UI - Get Icon Bind

function scr_UI_GetIconBind(targetInput,targetPlayerNum = 0)
{
	var targetIcon = global.UI_IconBindings[? string(input_binding_get(targetInput,targetPlayerNum))];
	if (targetIcon == undefined)
	{
		return "";
	}
	else
	{
		return "[" + sprite_get_name(targetIcon) + "]";
	}
}
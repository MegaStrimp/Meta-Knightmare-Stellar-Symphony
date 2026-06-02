///@description MKSS - Switch - Pedestal - Paint Changer

function scr_MKSS_Pedestal_Activation_PaintChanger()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	global.hasHud = false;
	
	isActive = true;
	with (instance_nearest(x,y,obj_MKSS_PaintChanger))
	{
		scr_MKSS_PaintChanger_SetPaletteList();
		
		isActive = true;
	}
	with (targetPlayer) isPaused = true;
}
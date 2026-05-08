///@description MKSS - Switch - Pedestal - Paint Changer

function scr_MKSS_Pedestal_Activation_PaintChanger()
{
	scr_PlaySfx(snd_MKSS_ButtonChange);
	
	isActive = true;
	with (obj_MKSS_PaintChanger)
	{
		scr_MKSS_PaintChanger_SetPaletteList();
		
		ownerPedestal = other;
		isActive = true;
	}
	with (targetPlayer) isPaused = true;
}
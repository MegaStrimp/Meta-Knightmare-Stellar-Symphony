///@description MKSS - Attack - Starless Marx - Flying Apparition - Draw Self

function scr_MKSS_Attack_StarlessMarx_FlyingApparition_DrawSelf()
{
	#region Draw Self
	scr_MKSS_Attack_DrawSelf();
	#endregion
	
	#region Overlay
	scr_DrawMask_Begin();
	
	scr_DrawMask_Mask(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,.75);
	
	for (var i = 0; i < 5; i++)
	{
		for (var h = 0; h < 5; h++)
		{
			var offset = (global.currentTimePausable / 10) % 126;
			draw_sprite(spr_MKSS_Enemy_StarlessMarx_Overlay_Cutter,0,x + offset + ((i - 2) * 126),y + offset + ((h - 2) * 126));
		}
	}
	
	scr_DrawMask_End();
	#endregion
}
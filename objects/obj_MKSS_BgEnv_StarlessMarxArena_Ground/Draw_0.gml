///@description Draw

#region Draw Self
draw_self();
#endregion

#region Overlay
if (hasOverlay)
{
	var targetAlpha = sine_between((global.currentTimePausable / 10),10,0,.25);
	
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprEnraged,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,targetAlpha);
	gpu_set_blendmode(bm_normal);
}
#endregion
///@description Draw Mask - Line Mask

function scr_DrawMask_LineMask(x1,y1,x2,y2,w,targetAlpha = 1)
{
	draw_set_alpha(targetAlpha);
	draw_line_width(x1,y1,x2,y2,w);
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);
	
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
	draw_set_alpha(1);
}
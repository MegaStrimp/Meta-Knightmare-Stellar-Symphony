///@description MKSS - Attack - Starless Marx - Black Hole - Draw

function scr_MKSS_Attack_StarlessMarx_BlackHole_Draw()
{
	draw_self();
	
	draw_set_alpha(circleAlpha);
	if (circleRadius > 0) draw_ellipse_color(x - circleRadius,y - circleRadius,x + circleRadius,y + circleRadius,c_blue,c_blue,false);
	draw_set_alpha(1);
}
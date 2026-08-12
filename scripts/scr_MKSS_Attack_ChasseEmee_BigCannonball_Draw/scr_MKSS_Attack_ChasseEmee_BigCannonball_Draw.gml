///@description MKSS - Attack - Chasse Emee - Big Cannonball - Draw

function scr_MKSS_Attack_ChasseEmee_BigCannonball_Draw()
{
	draw_set_color(c_black);
	draw_set_alpha(.5);
	draw_roundrect_colour_ext(x-shadowScale,shadowY-(shadowScale/6)+2,x+shadowScale,shadowY+(shadowScale/6)+2,12,12,c_black,c_black,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	if (sprite_index != -1) draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
///@description MKSS - Attack - Nimbia - Kracklet - Draw

function scr_MKSS_Attack_Nimbia_Kracklet_Draw()
{
	if (sprite_index != -1) draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	draw_sprite_ext(spr_MKSS_Attack_Nimbia_KrackletEye,eyeAngle,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
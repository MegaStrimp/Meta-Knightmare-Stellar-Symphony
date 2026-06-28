///@description MKSS - Attack - Nimbia - Decoy Cloud - Draw

function scr_MKSS_Attack_Nimbia_DecoyCloud_Draw()
{
	if (sprite_index != -1) draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	if (eye) draw_sprite_ext(spr_MKSS_Attack_Nimbia_DecoyCloudEye,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
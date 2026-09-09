///@description MKSS - Attack - Andromeda 1 - Star Shot - Draw

function scr_MKSS_Attack_Andromeda1_StarShot_Draw()
{
	draw_sprite_ext(spr_MKSS_Attack_Andromeda1_StarShot_Back,image_index,x,y,image_xscale,image_yscale,rotateAngleBack,image_blend,.5);
	if (sprite_index != -1) draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rotateAngle,image_blend,image_alpha);
}
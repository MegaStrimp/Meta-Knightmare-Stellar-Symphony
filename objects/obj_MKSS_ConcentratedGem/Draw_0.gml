///@description Draw

#region Variables
var knockbackDir = 1;
if (current_time % 2) knockbackDir = -1;
#endregion

#region Draw Self
if (global.shaders) pal_swap_set(gemPalette,1,false);
draw_sprite_ext(sprite_index,image_index,x + lengthdir_x(knockbackLength * knockbackDir,knockbackAngle),y + lengthdir_y(knockbackLength * knockbackDir,knockbackAngle),image_xscale,image_yscale,image_angle,image_blend,image_alpha); 
if (global.shaders) pal_swap_reset();
#endregion
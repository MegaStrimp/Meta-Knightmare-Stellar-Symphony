///@description Draw

#region Variables
var knockbackDir = 1;
if (current_time % 2) knockbackDir = -1;
#endregion

#region Draw Self
draw_sprite(sprite_index,image_index,x + lengthdir_x(knockbackLength * knockbackDir,knockbackAngle),y + lengthdir_y(knockbackLength * knockbackDir,knockbackAngle)); 
#endregion
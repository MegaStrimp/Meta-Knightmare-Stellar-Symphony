///@description Draw

#region Variables
var knockbackDir = 1;
if (current_time % 2) knockbackDir = -1;

var hasShake = (shakeTimer != -1);

var shakeX = choose(-hasShake,hasShake);
var shakeY = choose(-hasShake,hasShake);
#endregion

#region Draw Self
if (global.shaders) pal_swap_set(gemPalette,1,false);
draw_sprite_ext(sprite_index,image_index,x + shakeX + lengthdir_x(knockbackLength * knockbackDir,knockbackAngle),y + shakeY + lengthdir_y(knockbackLength * knockbackDir,knockbackAngle),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if (global.shaders) pal_swap_reset();
#endregion

#region Crack
scr_DrawMask_Begin();

scr_DrawMask_Mask(sprite_index,image_index,x + shakeX + lengthdir_x(knockbackLength * knockbackDir,knockbackAngle),y + shakeY + lengthdir_y(knockbackLength * knockbackDir,knockbackAngle));

var crackSpriteFinal = spr_MKSS_ConcentratedGem_Crack_Blue;
if (global.shaders) crackSpriteFinal = crackSprite;
draw_sprite_ext(crackSpriteFinal,(hpMax - hp),x + shakeX + lengthdir_x(knockbackLength * knockbackDir,knockbackAngle),y + shakeY + lengthdir_y(knockbackLength * knockbackDir,knockbackAngle),image_xscale,image_yscale,image_angle,image_blend,image_alpha); 

scr_DrawMask_End();
#endregion
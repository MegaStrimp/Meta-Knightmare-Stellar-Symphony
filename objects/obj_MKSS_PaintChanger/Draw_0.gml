///@description Draw

#region Paint Roller
draw_sprite_ext(paintRollerSprite,paintRollerIndex,x + 72 - paintRollerOffset,y + 16,-1,1,0,c_white,1);

if (global.shaders) pal_swap_set(currentSprite,1,false);
draw_sprite_ext(paintRollerCanSprite,paintRollerIndex,x + 72 - paintRollerOffset,y + 16,-1,1,0,c_white,1);
if (global.shaders) pal_swap_reset();
#endregion
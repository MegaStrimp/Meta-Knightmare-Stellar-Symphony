///@description Draw

#region Draw Self
if (global.shaders) pal_swap_set(palSprite,palIndex,false);
draw_self();
if (global.shaders) pal_swap_reset();
#endregion
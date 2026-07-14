///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Background
draw_set_alpha(alpha / 2);
draw_set_color(c_black);
draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
draw_set_color(c_white);
draw_set_alpha(1);
#endregion

#region Gem
if (global.shaders) pal_swap_set(gemPalette,1,false);
draw_sprite_ext(spr_MKSS_ConcentratedGem_Large,gemIndex,xx + (global.gameWidth / 2),yy + (global.gameHeight / 2),1,1,0,c_white,alpha);
if (global.shaders) pal_swap_reset();
#endregion

#region Decals
if ((global.shaders) and (global.MKSS_CurrentDecalPalette != -1)) pal_swap_set(global.MKSS_CurrentDecalPalette,1,false);
draw_sprite(spr_MKSS_UI_Decal1,0,xx + lengthdir_x(decalLength,45),yy + 160 + lengthdir_y(decalLength,45));
draw_sprite(spr_MKSS_UI_Decal2,0,xx + 240 + lengthdir_x(-decalLength,45),yy + lengthdir_y(-decalLength,45));
if ((global.shaders) and (global.MKSS_CurrentDecalPalette != -1)) pal_swap_reset();
#endregion

#region Text
scribble("[fnt_Advance]"+ gemTitle + "\n\nYou Have Unlocked" + unlockTitle + "[/font]").wrap(200).draw(xx + 4 + textOffset,yy + 8);
#endregion

#region Button Hints
var continueIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
if (targetIcon != undefined) continueIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(continueIcon + " Continue");
text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_YTimer != -1)));
#endregion
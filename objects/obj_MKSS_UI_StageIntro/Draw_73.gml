///@description Draw End

#region Variables
var xx = camera_get_view_x(mainView);
var yy = camera_get_view_y(mainView);
#endregion

#region Overlay
draw_set_color(c_black);
draw_set_alpha(overlayAlpha);
draw_rectangle(xx,yy,xx + global.gameWidth,yy + global.gameHeight,false);
draw_set_color(c_white);
draw_set_alpha(1);
#endregion

#region Game Logo
draw_sprite_ext(spr_MKSS_UI_StageIntro_GameLogo,0,xx + 198,yy + 114,1,1,0,c_white,overlayAlpha * 2);
#endregion

#region Sheets
for (var i = 0; i < 2; i++)
{
	draw_sprite(spr_MKSS_UI_StageIntro_Sheet,0,xx + sheetX - (sheetWidth * i),yy + 4 - sheetY);
	draw_sprite(spr_MKSS_UI_StageIntro_Sheet,0,xx - sheetX + (sheetWidth * i),yy + 147 + sheetY);
}
#endregion

#region Decals
if ((global.shaders) and (decalPalette != -1)) pal_swap_set(decalPalette,1,false);
draw_sprite(spr_MKSS_UI_Decal1,0,xx + lengthdir_x(decalLength,45),yy + 160 + lengthdir_y(decalLength,45));
draw_sprite(spr_MKSS_UI_Decal2,0,xx + 240 + lengthdir_x(-decalLength,45),yy + lengthdir_y(-decalLength,45));
if ((global.shaders) and (decalPalette != -1)) pal_swap_reset();
#endregion

#region Stage Title
draw_sprite(stageTitleSprite,0,xx + stageTitleX,yy + stageTitleY);
#endregion
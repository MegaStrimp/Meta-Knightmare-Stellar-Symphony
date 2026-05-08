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
	
#region Stage Score
if (global.inStage)
{
	draw_sprite(medalSprite,0,xx + 16+ textOffset,yy + 61);
	
	var displayedScore = string_replace_all(string_format(stageScore,6,0)," ","0");
	scribble(stageScoreFont + string(displayedScore) + "[/font]").draw(xx + 33+ textOffset,yy + 57);
}
#endregion

#region Text
scribble("[fnt_Advance]" + title + "[/font]").draw(xx + 4 + textOffset,yy + 18);
scribble("[fnt_Advance]" + subtitle + "[/font]").draw(xx + 28 + textOffset,yy + 32);
scribble("[fnt_Advance]" + description + "[/font]").wrap(200).align(fa_center,fa_middle).draw(xx + (global.gameWidth / 2) + textOffset,yy + (global.gameHeight / 2) + 32);
#endregion

#region Button Hints
var hubIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
if (targetIcon != undefined) hubIcon = "[" + sprite_get_name(targetIcon) + "]";

scribble(hubIcon + " Halberd").draw(xx + 4,yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_BTimer != -1)));

var nextIcon = "";
var targetIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
if (targetIcon != undefined) nextIcon = "[" + sprite_get_name(targetIcon) + "]";

var text = scribble(nextIcon + " Begin");
text.draw(xx + global.gameWidth - 4 - text.get_width(),yy + global.gameHeight - 16 + hintOffset + (2 * (buttonInputTimerComponent_YTimer != -1)));
#endregion
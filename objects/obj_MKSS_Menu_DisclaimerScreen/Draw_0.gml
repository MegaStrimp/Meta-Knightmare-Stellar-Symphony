///@description Draw

#region Overlay
var color = c_black;
if ((state == 3) and ((current_time % 4) == 0)) color = c_dkgray;
draw_set_color(color);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_color(c_white);
#endregion

#region Disclaimer
if (disclaimerAlpha != 0)
{
	scribble("[fnt_Advance_Small][alpha," + string(disclaimerAlpha) + "]This is a non-profit art project. All rights of Kirby characters, lore, music and other assets belong to [c_orange]Hal Labs and Nintendo[/color][/alpha][/font]").align(fa_center,fa_bottom).wrap(global.gameWidth).draw(global.gameWidth / 2,global.gameHeight);
}
#endregion

#region Sword
draw_sprite_ext(spr_MKSS_Menu_TitleScreen_Logo_SwordMask,0,swordX,swordY,1,1,swordAngle,c_white,1);
#endregion

#region Strimp
if (strimpState != 2)
{
	draw_sprite_ext(strimpSprite,strimpFrame,strimpX,strimpY,1,1,strimpAngle,c_white,1);
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_StrimpText,strimpFrame,strimpX,strimpY,1,1,0,c_white,disclaimerAlpha);
}
#endregion
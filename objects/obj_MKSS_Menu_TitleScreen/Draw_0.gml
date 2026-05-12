///@description Draw

#region Title
if (state <= 3)
{
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_Logo_Title,0,21,5,1,1,0,c_white,1);
}
#endregion

#region Overlay
if (blackAlpha != 0)
{
	var color = c_black;
	if ((state == 3) and ((current_time % 4) == 0)) color = c_dkgray;
	draw_set_color(color);
	draw_set_alpha(blackAlpha);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_color(c_white);
}
#endregion

#region Logo
draw_sprite_ext(spr_MKSS_Menu_TitleScreen_Logo_Sword,0,swordX,swordY,1,1,swordAngle,c_white,1);
draw_sprite_ext(spr_MKSS_Menu_TitleScreen_Logo_SwordMask,0,swordX,swordY,1,1,swordAngle,c_white,swordMaskAlpha);

if (state <= 3)
{
	scr_DrawMask_Begin();
	scr_DrawMask_Mask(spr_MKSS_Menu_TitleScreen_Logo_SwordMask,0,swordX,swordY,1,1,swordAngle,c_white,1);
	
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_Logo_SwordShine,0,swordX + swordShineX,swordY,1,1,swordAngle,c_white,1);
	
	scr_DrawMask_End();
	
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_Logo_Subtitle,subtitleFrame,59,50 + sine_wave(current_time / 2000, 1, 2, 0),1,1,0,c_white,1);
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_Logo_Stars,0,30,47,1,1,0,c_white,starAlpha);
}
#endregion

#region Button Hints
if (state == 3)
{
	scribble("[fnt_Advance]PRESS START[/font]").align(fa_center).draw(120,120);
}
#endregion

#region Version Number
if ((blackAlpha == 0) and (state < 4))
{
	var text = "VERSION ";
	if (global.demo) text = "DEMO VERSION ";
	
	scribble("[fnt_Advance_Small]" + string(text) + string(global.versionNumber) + "[/font]").align(fa_right,fa_bottom).draw(238,158);
}
#endregion

#region Button Text
scribble("[fnt_Advance]" + currentButtonText + "[/font]").align(fa_center,fa_bottom).wrap(74).draw(38,158);
#endregion
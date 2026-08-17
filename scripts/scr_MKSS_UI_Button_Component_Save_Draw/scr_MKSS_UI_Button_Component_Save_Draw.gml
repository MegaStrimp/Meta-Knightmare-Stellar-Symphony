///@description MKSS - UI - Button - Component - Save - Draw

function scr_MKSS_UI_Button_Component_Save_Draw(targetNum)
{
	#region Button
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1);
	#endregion
	
	#region Pattern
	scr_DrawMask_Begin();
	
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveMask,0,x,y + 1,1,1,0,c_white,.5);
	
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);
	
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
	
	for (var i = 0; i < 2; i++)
	{
		var targetPatternXOffset = ((i - 1) * 200) + saveButtonPatternX;
		
		if (global.shaders) pal_swap_set(spr_MKSS_Menu_TitleScreen_SavePattern_Palette,targetNum + 1,false);
		draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SavePattern,0,x - targetPatternXOffset,y + 6,1,1,0,c_white,1);
		if (global.shaders) pal_swap_reset();
	}
	
	scr_DrawMask_End();
	#endregion
	
	#region Completion
	var saveProgressFinal = obj_MKSS_Menu_TitleScreen.saveExists[targetNum];
	
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveText,0,x - 181,14 + (targetNum * 40),1,1,0,c_white,1);
	draw_sprite_ext(fnt_MKSS_Menu_TitleScreen_Save,targetNum + 1,x - 138,14 + (targetNum * 40),1,1,0,c_white,1);
	
	scribble("[fnt_MKSS_Menu_TitleScreen_Save]" + string(saveProgressFinal) + "%[/font]").draw(x - 112,14 + (targetNum * 40));
	#endregion
	
	#region Button Hints
	if (obj_MKSS_Menu_TitleScreen.saveExists[targetNum])
	{
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("Y"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,x - 17,y + 20 + (2 * (buttonInputTimerComponent_YTimer != -1)));
	}
	#endregion
}
///@description MKSS - UI - Button - Component - Save - Draw

function scr_MKSS_UI_Button_Component_Save_Draw(targetNum)
{
	#region Button
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1);
	#endregion
	
	#region Pattern STRIMPTODO NOT WORKING
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
	
	#region Completion STRIMPTODO Refactor the font
	var saveCompletionNum1 = clamp(saveProgress,0,100);
	var num1 = -1;
	if (saveCompletionNum1 == 100) num1 = floor(saveCompletionNum1 / 100);
	var num2 = -1;
	if (saveCompletionNum1 >= 10) num2 = floor((saveCompletionNum1 - (max(0,num1) * 100)) / 10);
	var num3 = -1;
	num3 = floor(saveCompletionNum1 - (max(0,num1) * 100) - (max(0,num2) * 10));
	
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveText,0,x - 181,14 + (targetNum * 40),1,1,0,c_white,1);
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveFont,targetNum + 1,x - 138,14 + (targetNum * 40),1,1,0,c_white,1);
	if (num1 != -1) draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveFont,num1,x - 120,14 + (targetNum * 40),1,1,0,c_white,1);
	if (num2 != -1) draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveFont,num2,x - 108,14 + (targetNum * 40),1,1,0,c_white,1);
	if (num3 != -1) draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveFont,num3,x - 96,14 + (targetNum * 40),1,1,0,c_white,1);
	draw_sprite_ext(spr_MKSS_Menu_TitleScreen_SaveFont,10,x - 80,14 + (targetNum * 40),1,1,0,c_white,1);
	#endregion
}
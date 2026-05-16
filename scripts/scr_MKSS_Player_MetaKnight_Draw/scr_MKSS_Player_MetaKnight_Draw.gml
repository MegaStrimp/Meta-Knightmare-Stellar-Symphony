///@description MKSS - Player - Meta Knight - Draw

function scr_MKSS_Player_MetaKnight_Draw()
{
	#region Draw Self
	var palSpriteFinal = palSprite;
	var palIndexFinal = palIndex;
	if ((hurtState != hurtStates.none)
	or (attackMakeFlash)
	or (global.flag_MKSS_AbilitySwitch)) palIndexFinal = 2;
	
	if (metaPointFlashTimer != -1)
	{
		palSpriteFinal = palIndex_MetaPoint;
		palIndexFinal = 1;
	}
	
	if ((parryCooldownFlashTimer != -1) or (parryAttackBuffer))
	{
		palSpriteFinal = palIndex_ParryCooldown;
		palIndexFinal = 1;
	}
	
	var hasStarryEyes = false;
	
	if (sprite_index != undefined)
	{
		if ((global.shaders) and (palSpriteFinal != -1)) pal_swap_set(palSpriteFinal,palIndexFinal,false);
		draw_sprite_ext(sprite_index,image_index,x + shakeXFinal + drawXOffset,y + shakeYFinal + drawYOffset,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		if ((global.shaders) and (palSpriteFinal != -1)) pal_swap_reset();
		
		#region Shadow Mask
		if (shadowAlphaFinal != 0)
		{
			scr_DrawMask_Begin();
			
			scr_DrawMask_Mask(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,shadowAlphaFinal / 2);
			
			gpu_set_fog(true,c_black,0,0);
			draw_sprite_ext(sprite_index,image_index,x + shakeXFinal + drawXOffset + 2,y + shakeYFinal + drawYOffset + 2,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			gpu_set_fog(false,c_white,0,0);
			
			scr_DrawMask_End();
			
			if ((global.shaders) and (palSpriteFinal != -1)) pal_swap_set(palSpriteFinal,sprite_get_width(palSpriteFinal) - 2 + (hasStarryEyes),false);
			draw_sprite_ext(sprite_index,image_index,x + shakeXFinal + drawXOffset,y + shakeYFinal + drawYOffset,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			if ((global.shaders) and (palSpriteFinal != -1)) pal_swap_reset();
		}
		#endregion
	}
	#endregion
	
	#region Sword
	if (weaponSpriteSet != undefined)
	{
		var weaponSpriteIndex = scr_MKSS_Player_WeaponSpriteIndex();
		
		if (weaponSpriteIndex != undefined)
		{
			var swordPalette = spr_MKSS_Player_MetaKnight_Normal_Sword_Palette_Galaxia;
			
			if ((global.shaders) and (swordPalette != -1)) pal_swap_set(swordPalette,palIndexFinal,false);
			draw_sprite_ext(weaponSpriteIndex,image_index,x + shakeXFinal + drawXOffset,y + shakeYFinal + drawYOffset,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			if ((global.shaders) and (swordPalette != -1)) pal_swap_reset();
			
			#region Shadow Mask
			if (shadowAlphaFinal != 0)
			{
				scr_DrawMask_Begin();
				
				scr_DrawMask_Mask(weaponSpriteIndex,image_index,x + shakeXFinal + drawXOffset,y + shakeYFinal + drawYOffset,image_xscale,image_yscale,image_angle,image_blend,shadowAlphaFinal / 2);
				
				gpu_set_fog(true,c_black,0,0);
				draw_sprite_ext(weaponSpriteIndex,image_index,x + shakeXFinal + drawXOffset + 2,y + shakeYFinal + drawYOffset + 2,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
				gpu_set_fog(false,c_white,0,0);
				
				scr_DrawMask_End();
			}
			#endregion
		}
	}
	#endregion
	
	#region Tutorial Text
	if (tutorialTextAlpha != 0)
	{
		upIcon = global.UI_IconBindings[? string(input_binding_get("up"))];
		if (upIcon != undefined) upIcon = "[" + sprite_get_name(upIcon) + "]";
		
		downIcon = global.UI_IconBindings[? string(input_binding_get("down"))];
		if (downIcon != undefined) downIcon = "[" + sprite_get_name(downIcon) + "]";
		
		leftIcon = global.UI_IconBindings[? string(input_binding_get("left"))];
		if (leftIcon != undefined) leftIcon = "[" + sprite_get_name(leftIcon) + "]";
		
		rightIcon = global.UI_IconBindings[? string(input_binding_get("right"))];
		if (rightIcon != undefined) rightIcon = "[" + sprite_get_name(rightIcon) + "]";
		
		AIcon = global.UI_IconBindings[? string(input_binding_get("A"))];
		if (AIcon != undefined) AIcon = "[" + sprite_get_name(AIcon) + "]";
		
		BIcon = global.UI_IconBindings[? string(input_binding_get("B"))];
		if (BIcon != undefined) BIcon = "[" + sprite_get_name(BIcon) + "]";
		
		XIcon = global.UI_IconBindings[? string(input_binding_get("X"))];
		if (XIcon != undefined) XIcon = "[" + sprite_get_name(XIcon) + "]";
		
		YIcon = global.UI_IconBindings[? string(input_binding_get("Y"))];
		if (YIcon != undefined) YIcon = "[" + sprite_get_name(YIcon) + "]";
		
		LIcon = global.UI_IconBindings[? string(input_binding_get("L"))];
		if (LIcon != undefined) LIcon = "[" + sprite_get_name(LIcon) + "]";
		
		RIcon = global.UI_IconBindings[? string(input_binding_get("R"))];
		if (RIcon != undefined) RIcon = "[" + sprite_get_name(RIcon) + "]";
		
		LTIcon = global.UI_IconBindings[? string(input_binding_get("LT"))];
		if (LTIcon != undefined) LTIcon = "[" + sprite_get_name(LTIcon) + "]";
		
		RTIcon = global.UI_IconBindings[? string(input_binding_get("RT"))];
		if (RTIcon != undefined) RTIcon = "[" + sprite_get_name(RTIcon) + "]";
		
		startIcon = global.UI_IconBindings[? string(input_binding_get("start"))];
		if (startIcon != undefined) startIcon = "[" + sprite_get_name(startIcon) + "]";
		
		selectIcon = global.UI_IconBindings[? string(input_binding_get("select"))];
		if (selectIcon != undefined) selectIcon = "[" + sprite_get_name(selectIcon) + "]";
		
		var finalText = scr_String_ReplaceButtonSigns(tutorialText,upIcon,downIcon,leftIcon,rightIcon,AIcon,BIcon,XIcon,YIcon,LIcon,RIcon,LTIcon,RTIcon,startIcon,selectIcon);
		
		scribble("[alpha," + string(tutorialTextAlpha) + "]" + finalText + "[/alpha]").align(fa_center,fa_bottom).draw(x,y - 24);
	}
	#endregion
}
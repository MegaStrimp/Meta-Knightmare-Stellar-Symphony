///@description MKSS - Hud - Draw GUI

function scr_MKSS_Hud_DrawGUI()
{
	#region Variables
	canDraw = (!instance_exists(obj_MKSS_UI_NotifBox));
	#endregion
	
	#region Weapons
	if (hud_LeftIcon != undefined)
	{
		draw_sprite_ext(spr_MKSS_Hud_Weapon_Bg_Small,hud_WeaponBgIndex,2,global.gameHeight - 17,1,1,image_angle,image_blend,.25);
		
		draw_sprite_ext(hud_LeftIcon,0,9,global.gameHeight - 10,1,1,image_angle,image_blend,.8);
		
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("L"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,4,global.gameHeight - 30 + (2 * (buttonInputTimerComponent_LTimer != -1)));
	}
	
	if (hud_RightIcon != undefined)
	{
		draw_sprite_ext(spr_MKSS_Hud_Weapon_Bg_Small,hud_WeaponBgIndex,52,global.gameHeight - 17,1,1,image_angle,image_blend,.25);
		
		draw_sprite_ext(hud_RightIcon,0,59,global.gameHeight - 10,1,1,image_angle,image_blend,.8);
		
		var targetIcon = global.UI_IconBindings[? string(input_binding_get("R"))];
		if (targetIcon != undefined) draw_sprite(targetIcon,0,54,global.gameHeight - 30 + (2 * (buttonInputTimerComponent_RTimer != -1)));
	}
	
	if (hud_MiddleIcon != undefined)
	{
		draw_sprite_ext(spr_MKSS_Hud_Weapon_Bg,hud_WeaponBgIndex,19,126,1,1,image_angle,image_blend,.5);
		
		draw_sprite_ext(hud_MiddleIcon,0,34,global.gameHeight - 19 - (2 * global.flag_MKSS_AbilitySwitch),1,1,image_angle,image_blend,1);
	}
	#endregion
	
	#region Special
	if (hud_SpecialEnabled)
	{
		#region Bar
		var barLength = floor((global.MKSS_SpecialCurrent / global.MKSS_SpecialTarget) * 80);
		
		if (hud_SpecialBarFlashTimer != -1) gpu_set_fog(true,c_white,0,0);
		draw_sprite(spr_MKSS_Hud_Special_Border,0,69,global.gameHeight - 27);
		draw_sprite_part(spr_MKSS_Hud_Special_Front,0,0,0,barLength,22,69,global.gameHeight - 27);
		if (hud_SpecialBarFlashTimer != -1) gpu_set_fog(false,c_white,0,0);
		#endregion
		
		#region Particles
		scr_DrawMask_Begin();
		draw_sprite_part_ext(spr_MKSS_Hud_Special_Mask,0,0,0,barLength,22,69,global.gameHeight - 27,1,1,c_white,1);
		gpu_set_blendenable(true);
		gpu_set_colorwriteenable(true,true,true,true);
		
		gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
		gpu_set_alphatestenable(true);
		draw_set_alpha(1);
		
		for (var i = 0; i < hud_SpecialBarParticleAmount; i++)
		{
			draw_sprite(spr_MKSS_Hud_Special_Particles,hud_SpecialBarParticle[i].index,69 + hud_SpecialBarParticle[i].xOffset,global.gameHeight - 27 + hud_SpecialBarParticle[i].yOffset);
		}
		
		scr_DrawMask_End();
		#endregion
		
		#region Button Hints
		if (global.MKSS_SpecialCurrent == global.MKSS_SpecialTarget)
		{
			var targetIcon = global.UI_IconBindings[? string(input_binding_get("Y"))];
			if (targetIcon != undefined) draw_sprite(targetIcon,0,104,global.gameHeight - 32 + (2 * (buttonInputTimerComponent_YTimer != -1)));
		}
		#endregion
	}
	#endregion
	
	#region Healthbar
	var barLength = floor((global.playerHp[0] / global.playerMaxHp[0]) * 59);
	
	draw_sprite(spr_MKSS_Hud_Healthbar_Back,0,78,global.gameHeight - 12);
	draw_sprite_part(spr_MKSS_Hud_Healthbar_Front,0,0,0,max(0,barLength - 6),7,78,global.gameHeight - 12);
	draw_sprite(spr_MKSS_Hud_Healthbar_Corner,0,78 - 6 + barLength,global.gameHeight - 12);
	draw_sprite(spr_MKSS_Hud_Healthbar_Border,0,72,global.gameHeight - 20);
	#endregion
	
	#region Meta Points
	var textCol = "#FFFFFF";
	var iconCol = #FFFFFF;
	if (metaPointCollectTimer != -1)
	{
		textCol = "#B2FFFF";
		iconCol = #B2FFFF;
	}
	var hasScoreOffset = ((global.inStage) and (global.MKSS_StageHasScore));
	
	draw_sprite_ext(spr_MKSS_Hud_MetaPoints_Icon,0,2,38 - (36 * !hasScoreOffset) - (metaPointCollectTimer != -1),1,1,0,iconCol,1);
	
	var displayedPoints = string_replace_all(string_format(hud_DisplayedMetaPoints,4,0)," ","0");
	scribble("[fnt_Advance_Small][" + string(textCol) + "]x[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(14,44 - (36 * !hasScoreOffset));
	#endregion
	
	#region Enemy Hp
	var markedEnemyIDFinal = noone;
	
	if ((global.MKSS_MarkedEnemyID != -1) and (instance_exists(global.MKSS_MarkedEnemyID)))
	{
		markedEnemyIDFinal = global.MKSS_MarkedEnemyID;
		var enemyTitle = global.MKSS_MarkedEnemyTitle;
		var enemyHealthbarScript = global.MKSS_MarkedEnemyHealthbarScript;
	}
	else if ((global.MKSS_MarkedBossID != -1) and (instance_exists(global.MKSS_MarkedBossID)))
	{
		markedEnemyIDFinal = global.MKSS_MarkedBossID;
		var enemyTitle = global.MKSS_MarkedBossTitle;
		var enemyHealthbarScript = global.MKSS_MarkedBossHealthbarScript;
	}
	
	if (markedEnemyIDFinal != noone) script_execute_ext(enemyHealthbarScript,[markedEnemyIDFinal,enemyTitle]);
	#endregion
	
	#region Stage Score
	if ((global.inStage) and (global.MKSS_StageHasScore))
	{
		draw_sprite(hud_MedalSprite,hud_MedalIndex,24,14);
		
		if (hud_MedalTier != -1)
		{
			scr_DrawMask_Begin();
			scr_DrawMask_Mask(hud_MedalSprite,hud_MedalIndex,24,14);
			
			draw_sprite_ext(spr_MKSS_UI_Medal_Shine,0,floor(200 - ((global.currentTimePausable * 2) % 200)),14,1,1,0,c_white,.5);
			
			scr_DrawMask_End();
		}
		
		for (var i = 0; i < max(0,hud_MedalTier); i++)
		{
			draw_sprite(spr_MKSS_Particle_SmallSparkle,hud_MedalSparkleIndex,floor(12 + hud_MedalSparkleX[i]),floor(26 - hud_MedalSparkleY[i]));
		}
		
		var displayedScore = string_replace_all(string_format(global.levelScoreCurrent,6,0)," ","0");
		scribble(hud_MedalFont + string(displayedScore) + "[/font]").align(fa_center).draw(24,28);
	}
	#endregion
}
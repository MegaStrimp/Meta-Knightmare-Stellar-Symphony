///@description MKSS - Hud - Draw GUI

function scr_MKSS_Hud_DrawGUI()
{
	#region Weapons
	if (hud_LeftIcon != undefined)
	{
		draw_sprite_ext(spr_MKSS_Hud_Weapon_Bg_Small,hud_WeaponBgIndex,2,global.gameHeight - 17,1,1,image_angle,image_blend,.25);
		
		draw_sprite_ext(hud_LeftIcon,0,9,global.gameHeight - 10,1,1,image_angle,image_blend,.8);
	}
	
	if (hud_RightIcon != undefined)
	{
		draw_sprite_ext(spr_MKSS_Hud_Weapon_Bg_Small,hud_WeaponBgIndex,52,global.gameHeight - 17,1,1,image_angle,image_blend,.25);
		
		draw_sprite_ext(hud_RightIcon,0,59,global.gameHeight - 10,1,1,image_angle,image_blend,.8);
	}
	
	if (hud_MiddleIcon != undefined)
	{
		draw_sprite_ext(spr_MKSS_Hud_Weapon_Bg,hud_WeaponBgIndex,19,126,1,1,image_angle,image_blend,.5);
		
		draw_sprite_ext(hud_MiddleIcon,0,34,global.gameHeight - 19 - (2 * global.flag_MKSS_AbilitySwitch),1,1,image_angle,image_blend,1);
	}
	#endregion
	
	#region Healthbar
	var barLength = floor((global.playerHp[0] / global.playerMaxHp[0]) * 55);
	
	draw_sprite(spr_MKSS_Hud_Healthbar_Back,0,79,global.gameHeight - 13);
	draw_sprite_stretched(spr_MKSS_Hud_Healthbar_Front,0,79,global.gameHeight - 13,barLength,7);
	draw_sprite(spr_MKSS_Hud_Healthbar_Corner,0,79 - 4 + barLength,global.gameHeight - 13);
	draw_sprite(spr_MKSS_Hud_Healthbar_Border,0,72,global.gameHeight - 21);
	#endregion
	
	#region Special
	if (hud_SpecialEnabled)
	{
		var barLength = floor((global.MKSS_SpecialCurrent / global.MKSS_SpecialTarget) * 80);
		
		draw_sprite(spr_MKSS_Hud_Special_Border,0,69,global.gameHeight - 29);
		draw_sprite_part(spr_MKSS_Hud_Special_Front,0,0,0,barLength,22,69,global.gameHeight - 29);
	}
	#endregion
	
	#region Meta Points
	var textCol = #FFFFFF;
	if (metaPointCollectTimer != -1) textCol = #B2FFFF;
	var hasScoreOffset = ((global.inStage) and (global.MKSS_StageHasScore))
	
	draw_sprite_ext(spr_MKSS_Hud_MetaPoints_Icon,0,2,38 - (36 * !hasScoreOffset) - (metaPointCollectTimer != -1),1,1,0,textCol,1);
	
	var displayedPoints = string_replace_all(string_format(global.MKSS_PlayerMetaPoints[0],4,0)," ","0");
	scribble("[fnt_Advance_Small][d#" + string(textCol) + "]x[fnt_Advance]" + string(displayedPoints) + "[/font][/color]").draw(14,44 - (36 * !hasScoreOffset));
	#endregion
	
	#region Enemy Hp
	var markedEnemyIDFinal = noone;
	
	if ((global.MKSS_MarkedEnemyID != -1) and (instance_exists(global.MKSS_MarkedEnemyID)))
	{
		markedEnemyIDFinal = global.MKSS_MarkedEnemyID;
		var enemyTitle = global.MKSS_MarkedEnemyTitle;
	}
	else if ((global.MKSS_MarkedBossID != -1) and (instance_exists(global.MKSS_MarkedBossID)))
	{
		markedEnemyIDFinal = global.MKSS_MarkedBossID;
		var enemyTitle = global.MKSS_MarkedBossTitle;
	}
	
	if (markedEnemyIDFinal != noone)
	{
		#region Shake
		var shakeFinal = 0;
		
		if (!global.pauseFinal)
		{
			var canShake = (markedEnemyIDFinal.hpHealthbarShakeTimer != -1)
			
			shakeFinal = floor(choose(-canShake,canShake));
		}
		#endregion
		
		var enemyHp = markedEnemyIDFinal.hpHealthbar;
		var enemyHpMiddle = markedEnemyIDFinal.hpHealthbarMiddle;
		var enemyMaxHp = markedEnemyIDFinal.maxHp;
		
		var barLength = floor((enemyHp / enemyMaxHp) * 66);
		var barLengthMiddle = floor((enemyHpMiddle / enemyMaxHp) * 66);
		
		draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Back,0,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11);
		draw_sprite_stretched(spr_MKSS_Hud_EnemyHealthbar_Middle,0,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11,barLengthMiddle,6);
		draw_sprite(spr_MKSS_Hud_EnemyHealthbar_MiddleCorner,0,global.gameWidth - 76 - 5 + barLengthMiddle + shakeFinal,global.gameHeight - 11);
		draw_sprite_stretched(spr_MKSS_Hud_EnemyHealthbar_Front,0,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11,barLength,6);
		draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Corner,0,global.gameWidth - 76 - 5 + barLength + shakeFinal,global.gameHeight - 11);
		draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Border,0,global.gameWidth - 92 + shakeFinal,global.gameHeight - 20);
		draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Icon,0,global.gameWidth - 92 + 3 + shakeFinal,global.gameHeight - 20 + 3);
		
		draw_set_font(global.fontSpriteEnemyHealthbar);
		if (enemyTitle != -1) draw_text(167 + shakeFinal,global.gameHeight - 23,string(enemyTitle));
		draw_set_font(global.fontSpriteMain);
	}
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
		scribble("[fnt_Advance]" + string(displayedScore) + "[/font]").align(fa_center).draw(24,28);
	}
	#endregion
}
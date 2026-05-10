///@description MKSS - Hud - Enemy Healthbar - Starless

function scr_MKSS_Hud_EnemyHealthbar_Starless(targetMarkedEnemyID,targetEnemyTitle)
{
	#region Shake
	var shakeFinal = 0;
	
	if (!global.pauseFinal)
	{
		var canShake = (targetMarkedEnemyID.hpHealthbarShakeTimer != -1)
			
		shakeFinal = floor(choose(-canShake,canShake));
	}
	#endregion
	
	#region Enemy Healthbar
	var enemyHp = targetMarkedEnemyID.hpHealthbar;
	var enemyHpMiddle = targetMarkedEnemyID.hpHealthbarMiddle;
	var enemyMaxHp = targetMarkedEnemyID.maxHp;
	
	var barLength = floor((enemyHp / enemyMaxHp) * 66);
	var barLengthMiddle = floor((enemyHpMiddle / enemyMaxHp) * 66);
	
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Starless_Back,0,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11);
	draw_sprite_stretched(spr_MKSS_Hud_EnemyHealthbar_Starless_Middle,0,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11,barLengthMiddle,6);
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Starless_MiddleCorner,0,global.gameWidth - 76 - 5 + barLengthMiddle + shakeFinal,global.gameHeight - 11);
	draw_sprite_stretched(spr_MKSS_Hud_EnemyHealthbar_Starless_Front,0,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11,barLength,6);
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Starless_Corner,0,global.gameWidth - 76 - 5 + barLength + shakeFinal,global.gameHeight - 11);
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Starless_Border,0,global.gameWidth - 93 + shakeFinal,global.gameHeight - 20);
	
	scribble("[fnt_MKSS_UI_EnemyHealthbar][#74B8FF]" + string(targetEnemyTitle) + "[/font][/color]").draw(167 + shakeFinal,global.gameHeight - 23);
	#endregion
}
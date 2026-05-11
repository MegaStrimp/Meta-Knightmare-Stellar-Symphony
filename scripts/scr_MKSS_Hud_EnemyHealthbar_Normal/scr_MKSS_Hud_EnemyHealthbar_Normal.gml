///@description MKSS - Hud - Enemy Healthbar - Normal

function scr_MKSS_Hud_EnemyHealthbar_Normal(targetMarkedEnemyID,targetEnemyTitle)
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
	
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Normal_Back,0,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11);
	draw_sprite_part(spr_MKSS_Hud_EnemyHealthbar_Normal_Middle,0,0,0,max(0,barLengthMiddle - 5),6,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11);
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Normal_MiddleCorner,0,global.gameWidth - 76 - 5 + barLengthMiddle + shakeFinal,global.gameHeight - 11);
	draw_sprite_part(spr_MKSS_Hud_EnemyHealthbar_Normal_Front,0,0,0,max(0,barLength - 5),6,global.gameWidth - 76 + shakeFinal,global.gameHeight - 11);
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Normal_Corner,0,global.gameWidth - 76 - 5 + barLength + shakeFinal,global.gameHeight - 11);
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Normal_Border,0,global.gameWidth - 92 + shakeFinal,global.gameHeight - 20);
	draw_sprite(spr_MKSS_Hud_EnemyHealthbar_Normal_Icon,0,global.gameWidth - 92 + 3 + shakeFinal,global.gameHeight - 20 + 3);
	
	scribble("[fnt_MKSS_UI_EnemyHealthbar]" + string(targetEnemyTitle) + "[/font]").draw(167 + shakeFinal,global.gameHeight - 23);
	#endregion
}
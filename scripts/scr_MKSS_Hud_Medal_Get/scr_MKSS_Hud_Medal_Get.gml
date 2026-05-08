///@description MKSS - Hud - Medal - Get

function scr_MKSS_Hud_Medal_Get(targetTier)
{
	scr_PlaySfx(snd_MKSS_Medal);
	scr_PlaySfx(snd_MKSS_ParryExecute);
	
	with (obj_FrameworkControl)
	{
		hud_MedalTier = targetTier;
		
		switch (targetTier)
		{
			case -1:
			hud_MedalSprite = spr_MKSS_UI_Medal_None;
			break;
			
			case 0:
			hud_MedalSprite = spr_MKSS_UI_Medal_Bronze;
			break;
			
			case 1:
			hud_MedalSprite = spr_MKSS_UI_Medal_Silver;
			break;
			
			case 2:
			hud_MedalSprite = spr_MKSS_UI_Medal_Gold;
			break;
			
			case 3:
			hud_MedalSprite = spr_MKSS_UI_Medal_Platinum;
			break;
		}
		
		hud_MedalIndex = 0;
		hud_MedalSpeed = sprite_get_speed(hud_MedalSprite) / 60;
		hud_MedalSpeedMult = 5;
		hud_MedalNumber = sprite_get_number(hud_MedalSprite);
		hud_MedalSpinTimer = -1;
		
		for (var i = 0; i < max(0,hud_MedalTier); i++)
		{
			hud_MedalSparkleX[i] = irandom_range(0,hud_MedalSparkleXMax);
			hud_MedalSparkleY[i] = irandom_range(0,hud_MedalSparkleYMax);
			hud_MedalSparkleVsp[i] = random_range(hud_MedalSparkleVspMin,hud_MedalSparkleVspMax);
		}
	}
}
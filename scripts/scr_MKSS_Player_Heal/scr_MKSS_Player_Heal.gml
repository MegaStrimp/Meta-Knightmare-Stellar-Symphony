///@description MKSS - Player - Heal

function scr_MKSS_Player_Heal(playerNum,targetHeal,isMetaHeal = false)
{
	var finalHeal = min(global.playerMaxHp[playerNum] - global.playerHp[playerNum],targetHeal);
	finalHeal = targetHeal;
	
	if (finalHeal > 0)
	{
		var hitNumberFont = fnt_MKSS_UI_HitNumbers_Green;
		if (isMetaHeal) hitNumberFont = fnt_MKSS_UI_HitNumbers_Yellow;
		
		scr_MKSS_UI_HitNumbers_Create(finalHeal,hitNumberFont,x,y - 8,depth - 1,id,id);
		
		with (obj_MKSS_Control)
		{
			healPauseTargetHeal[playerNum] += finalHeal;
			healPauseTimer[playerNum] = 0;
		}
	}
}
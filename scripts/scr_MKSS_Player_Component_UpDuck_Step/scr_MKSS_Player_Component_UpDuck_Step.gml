///@description MKSS - Player - Component - Up Duck - Step

function scr_MKSS_Player_Component_UpDuck_Step(targetSprite = -1)
{
	if (attackIndex != -1)
	{
		flag_UpDuck = false;
		upDuckTimer = -1;
	}
	
	if (flag_UpDuck)
	{
		upDuckTimer = 7;
		
		if (!canFallHop) scr_PlaySfx(snd_MKSS_Squish);
		
		var parAngle = irandom_range(0,359);
		var parScaleDir = 1;
		if ((parAngle > 90) and (parAngle <= 270))
		{
			parScaleDir = -1;
		}
		
		scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
	}
	
	if (targetSprite != -1)
	{
		if ((upDuckTimer != -1) and (!isAttacking))
		{
			sprite_index = targetSprite;
		}
	}
	
	if (upDuckTimer != -1)
	{
		upDuckTimer = max(upDuckTimer - speedMultFinal,0);
		if (upDuckTimer == 0)
		{
			upDuckTimer = -1;
		}
	}
}
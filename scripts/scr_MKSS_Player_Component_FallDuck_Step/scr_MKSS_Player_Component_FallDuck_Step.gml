///@description MKSS - Player - Component - Fall Duck - Step

function scr_MKSS_Player_Component_FallDuck_Step(targetSprite = -1)
{
	if (attackIndex != -1)
	{
		flag_FallDuck = false;
		fallDuckTimer = -1;
	}
	
	if (flag_FallDuck)
	{
		fallDuckTimer = 7;
		
		if (!canFallHop) scr_PlaySfx(snd_MKSS_Squish);
		
		if (!flag_FallHop)
		{
			var parAngle = irandom_range(0,359);
			var parScaleDir = 1;
			if ((parAngle > 90) and (parAngle <= 270))
			{
				parScaleDir = -1;
			}
			
			scr_MKSS_ParticleSet_FallDuck(x,y,parScaleDir,parAngle);
		}
	}
	
	if (targetSprite != -1)
	{
		if ((fallDuckTimer != -1) and (grounded) and (!isAttacking))
		{
			sprite_index = targetSprite;
		}
	}
	
	if (fallDuckTimer != -1)
	{
		fallDuckTimer = max(fallDuckTimer - speedMultFinal,0);
		if (fallDuckTimer == 0)
		{
			fallDuckTimer = -1;
		}
	}
}
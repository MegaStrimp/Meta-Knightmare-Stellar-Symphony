///@description MKSS - Player - Component - Fall Hop - Step

function scr_MKSS_Player_Component_FallHop_Step(targetSprite = -1)
{
	if (attackIndex != -1)
	{
		fallHopTimer = -1;
		canFallHop = false;
		fallHopJumped = false;
	}
	
	if (flag_FallHop)
	{
		scr_PlaySfx(snd_MKSS_FallHop);
			
		forceJump = true;
		vsp = -(1.5 * speedMultFinal);
	}
	
	if (targetSprite != -1)
	{
		if ((canFallHop) and (!isAttacking))
		{
			sprite_index = targetSprite;
		}
	}
	
	if (sign(vsp) != 1) fallHopTimer = -1;
	
	if (fallHopTimer != -1)
	{
		fallHopTimer = max(fallHopTimer - speedMultFinal,0);
		if (fallHopTimer == 0)
		{
			canFallHop = true;
			fallHopTimer = -1;
		}
	}
	else if ((!canFallHop) and (!isFlying) and (sign(vsp) == 1))
	{
		fallHopTimer = fallHopTimerMax;
	}
}
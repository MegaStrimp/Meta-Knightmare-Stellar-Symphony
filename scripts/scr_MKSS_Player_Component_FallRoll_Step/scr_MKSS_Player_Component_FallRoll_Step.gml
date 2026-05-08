///@description MKSS - Player - Component - Fall Roll - Step

function scr_MKSS_Player_Component_FallRoll_Step(targetSprite = -1)
{
	if ((attackIndex != -1) or (grounded) or (isFlying))
	{
		canFallRoll = false;
	}
	
	if (sign(vsp) > 0)
	{
		if (flag_FallRoll)
		{
			if (targetSprite != -1) scr_ChangeSprite(targetSprite);
			
			flag_FallRoll = false;
		}
	}
}
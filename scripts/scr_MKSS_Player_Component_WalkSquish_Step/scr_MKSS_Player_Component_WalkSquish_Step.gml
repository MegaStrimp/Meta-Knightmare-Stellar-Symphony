///@description MKSS - Player - Component - Walk Squish - Step

function scr_MKSS_Player_Component_WalkSquish_Step(targetSprite = -1)
{
	if (attackIndex != -1)
	{
		flag_WalkSquish = false;
		walkSquishTimer = -1;
	}
	
	if (flag_WalkSquish)
	{
		walkSquishTimer = 7;
		
		scr_PlaySfx(snd_MKSS_Squish);
		
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
		if ((walkSquishTimer != -1) and (!isAttacking))
		{
			sprite_index = targetSprite;
		}
	}
	
	if (walkSquishTimer != -1)
	{
		walkSquishTimer = max(walkSquishTimer - speedMultFinal,0);
		if (walkSquishTimer == 0)
		{
			walkSquishTimer = -1;
		}
	}
}
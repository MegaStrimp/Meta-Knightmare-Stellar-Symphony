///@description MKSS - Enemy - Booler - AI - Chase - Mist - Step

function scr_MKSS_Enemy_Booler_AI_Chase_Mist_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		canBeHit = false;
		canHurtPlayer = false;
		
		if ((receivedAttackOwner != -1) and (instance_exists(receivedAttackOwner))) dirX = sign(x - receivedAttackOwner.x);
		if (dirX == 0) dirX = 1;
		drawDirX = dirX;
		
		visibleTimer = 0;
		visibleTimerMax = 3;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Home Into Player
		var switchStates = false;
		
		if ((receivedAttackOwner != -1) and (instance_exists(receivedAttackOwner)))
		{
			var targetX = receivedAttackOwner.x + (40 * -dirX);
			var targetY = receivedAttackOwner.y + (irandom_range(-8,8));
			
			move_towards_point(targetX,targetY,mistSpd);
			
			if (distance_to_point(targetX,targetY) <= mistSpd)
			{
				switchStates = true;
			}
		}
		else
		{
			switchStates = true;
		}
		
		if (switchStates)
		{
			canBeHit = true;
			canHurtPlayer = true;
			visibleTimer = -1;
			visible = true;
			speed = 0;
			x = floor(x);
			y = floor(y);
			
			scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Booler_AI_Chase_Float_Step);
		}
		#endregion
		
		#region Visible Timer
		if (visibleTimer != -1)
		{
			visibleTimer = max(visibleTimer - speedMultFinal,0);
			if (visibleTimer == 0)
			{
				visible = !visible;
				
				visibleTimer = visibleTimerMax;
			}
		}
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprDuck;
		#endregion
	}
}
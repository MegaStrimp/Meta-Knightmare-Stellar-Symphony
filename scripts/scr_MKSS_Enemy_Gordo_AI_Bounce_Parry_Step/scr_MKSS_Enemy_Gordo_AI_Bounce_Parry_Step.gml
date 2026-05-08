///@description MKSS - Enemy - Gordo - AI - Bounce - Parry - Step

function scr_MKSS_Enemy_Gordo_AI_Bounce_Parry_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		canHurtPlayer = false;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Attack Back
		if (instance_exists(target))
		{
			if ((point_distance(x,y,target.x,target.y) <= 8) or (place_meeting(x,y,target)))
			{
				with (target)
				{
					if (!global.MKSS_MinibossIsStunned) scr_MKSS_Score_Add(250);
					scr_MKSS_SpawnMetaPoint(8,x,y,depth - 1,other.owner,90);
					
					scr_MKSS_Enemy_Miniboss_Stun();
					scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_ChunkyDee_AI_Normal_Stun_Step);
					
					canHaveKnockback = true;
					hasKnockback = true;
					prevDefense = defense;
					defense /= 2;
					prevKnockbackResistance = knockbackResistance;
					knockbackResistance /= 1.5;
					
					scr_PlaySfx(snd_MKSS_EnemyHit);
					scr_PlaySfx(snd_MKSS_Stun);
					
					shakeX = 4;
					
					scr_Camera_SetScreenshake(4);
					
					scr_MKSS_Enemy_GetHit(id,other.owner,15,90 - (45 * sign(x - other.x)),3,other.speedMultFinal);
				}
				
				instance_destroy();
			}
			else
			{
			    move_towards_point(target.x,target.y,8);
			}
		}
		else
		{
			instance_destroy();
		}
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprParry;
		#endregion
	}
	else
	{
		speed = 0;
	}
}
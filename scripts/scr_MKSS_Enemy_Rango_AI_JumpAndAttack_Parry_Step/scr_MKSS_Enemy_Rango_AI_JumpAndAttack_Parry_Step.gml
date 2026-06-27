///@description MKSS - Enemy - Rango - AI - Jump and Attack - Parry - Step

function scr_MKSS_Enemy_Rango_AI_JumpAndAttack_Parry_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		destroyTimer = 1200;
		pauseOutsideView = false;
		hsp = 0;
		vsp = 0;
		canHurtPlayer = false;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Attack Back
		if ((instance_exists(target)) and (target != id))
		{
			if ((point_distance(x,y,target.x,target.y) <= 8) or (place_meeting(x,y,target)))
			{
				with (target)
				{
					scr_MKSS_Score_Add(50);
					scr_MKSS_SpawnMetaPoint(4,x,y,depth - 1,other.owner,90);
					
					scr_PlaySfx(snd_MKSS_EnemyHit);
					
					scr_Camera_SetScreenshake(2);
					
					if (object_index == obj_MKSS_Enemy_GigantEdge)
					{
						rangoParryCount++;
						if (rangoParryCount >= rangoParryCountMax)
						{
							hsp = -2 * dirX;
							vsp = -2;
							
							defense = prevDefense;
							
							scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_GigantEdge_AI_Normal_Stun_Step);
						}
					}
					
					script_execute(enemyGetHit,id,15,2,90 - (45 * sign(x - other.x)),other.owner,other.speedMultFinal);
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
			hsp = 8 * dirX * speedMultFinal;
			vsp = 0;
		}
		#endregion
		
		#region Destroy Timer
		if (destroyTimer != -1)
		{
			destroyTimer = max(destroyTimer - speedMultFinal,0);
			if (destroyTimer == 0)
			{
				instance_destroy();
		
				destroyTimer = -1;
			}
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
		
		#region Animation
		sprite_index = spriteSet.sprAttack;
		#endregion
	}
	else
	{
		speed = 0;
	}
}
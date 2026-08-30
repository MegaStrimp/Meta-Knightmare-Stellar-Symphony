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
					
					if (heldEnemy != -1)
					{
						with (heldEnemy)
						{
							isHeld = false;
							canBeHit = true;
						}
					}
					
					scr_MKSS_Enemy_Miniboss_Stun();
					scr_MKSS_Enemy_GetStunned(id);
					
					var sfx = scr_PlaySfx(snd_MKSS_EnemyHit);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					var sfx = scr_PlaySfx(snd_MKSS_Stun);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					shakeX = 4;
					
					scr_Camera_SetScreenshake(4);
					
					script_execute(enemyGetHit,id,floor(MKSS_Base_EnemyHP_Miniboss / 8),3,90 - (45 * sign(x - other.x)),other.owner,other.speedMultFinal);
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
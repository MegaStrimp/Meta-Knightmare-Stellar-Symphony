///@description MKSS - Enemy - Starless Marx - AI - Normal - Teleport - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_Teleport_Step()
{
	#region Setup
	if (enemyState_Setup)
	{
		sprite_index = spriteSet.sprBallIn;
		image_index = 0;
		
		enemyAnimationEnd = scr_MKSS_Enemy_StarlessMarx_AI_Normal_Teleport_AnimationEnd;
		
		canBeHit = false;
		canHurtPlayer = false;
		
		enemyState_Setup = false;
	}
	#endregion
	
	if (!localPause)
	{
		#region Teleport - Teleport Timer
		if (teleport_TeleportTimer != -1)
		{
			teleport_TeleportTimer = max(teleport_TeleportTimer - speedMultFinal,0);
			if (teleport_TeleportTimer == 0)
			{
				if (teleport_RandomCount <= 0)
				{
					x = teleport_TargetX;
					y = teleport_TargetY;
					
					if (teleport_CanFadeOut)
					{
						sprite_index = spriteSet.sprBallOut;
						image_index = 0;
					}
					else
					{
						canBeHit = true;
						canHurtPlayer = true;
						
						scr_Enemy_ChangeState_Step(id,teleport_TargetState);
					}
				}
				else
				{
					scr_PlaySfx(snd_MKSS_MarxAppear);
					
					sprite_index = spriteSet.sprBallIn;
					image_index = 0;
					
					x = irandom_range(24,room_width - 24);
					y = irandom_range(24,room_height - 24);
					
					teleport_RandomCount -= 1;
				}
				
				teleport_TeleportTimer = -1;
			}
		}
		#endregion
	}
}
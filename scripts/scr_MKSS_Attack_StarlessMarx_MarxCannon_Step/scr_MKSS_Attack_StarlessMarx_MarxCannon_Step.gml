///@description MKSS - Attack - Starless Marx - Marx Cannon - Step

function scr_MKSS_Attack_StarlessMarx_MarxCannon_Step()
{
	if (!localPause)
	{
		#region Particles
		if (particleTimer != -1)
		{
			particleTimer = max(particleTimer-speedMultFinal,0);
			if (particleTimer == 0)
			{
				scr_MKSS_ParticleSet_MarxCannon(owner.x+(24*owner.dirX),owner.y+irandom_range(-(laserHeight/2),laserHeight/2),12*owner.dirX,id);
				
				particleTimer = particleTimerMax;
			}
		}
		#endregion
		
		#region Laser
		if (!parried) laserWidth = min(laserWidth + (laserWidthGain * speedMultFinal),laserWidthMax);
		else laserWidth = point_distance(owner.x + (28 * owner.dirX),owner.y,obj_Player.x + (8 * obj_Player.dirX),owner.y);
		laserHeight = min(laserHeight + (laserHeightGain * speedMultFinal),laserHeightMax);
		
		laserHeightOffsetTimer = max(laserHeightOffsetTimer - speedMultFinal,0);
		if (laserHeightOffsetTimer == 0)
		{
			laserHeightOffset = !laserHeightOffset;
			
			laserHeightOffsetTimer = laserHeightOffsetTimerMax;
		}
		#endregion
		
		#region Damage Player
		with (obj_Player)
		{
			if (y > other.owner.y - (other.laserHeight / 2))
			{
				if (!other.parried)
				{
					if (playerStateStep != scr_MKSS_Player_MetaKnight_State_Parry_Step)
					{
						other.laserHurtTimer = max(other.laserHurtTimer - other.speedMultFinal,0);
						if (other.laserHurtTimer == 0)
						{
							var _amount = other.damageMax / 10;
							if (other.damage <= 0) _amount = 0;
							else scr_PlaySfx(snd_MKSS_Hurt);
							scr_MKSS_Player_GetHit(id,_amount);
					
							other.damage = max(other.damage - (other.damageMax / 10),0);
							other.laserHurtTimer = other.laserHurtTimerMax;
						}
					}
					else
					{
						scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_StarlessMarxLaserParry_Step);
						
						other.parried = true;
					}
				}
				else
				{
					
				}
			}
		}
		#endregion
	}
}
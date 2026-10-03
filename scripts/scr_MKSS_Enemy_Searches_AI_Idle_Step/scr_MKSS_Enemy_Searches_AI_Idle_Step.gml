///@description MKSS - Enemy - Searches - AI - Idle - Step

function scr_MKSS_Enemy_Searches_AI_Idle_Step()
{
	if (!localPause)
	{
		if (hp > 0)
		{
			#region Spot Player
			if ((explodeTimer == -1) and (distance_to_object(obj_Player) <= playerSpotRange))
			{
				image_index = 0;
				
				var nearestPlayer = instance_nearest(x,y,obj_Player);
				
				dirX = 1;
				if (nearestPlayer.x < x) dirX = -1;
				
				var sfx = scr_PlaySfx(snd_MKSS_EnemyJump);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				explodeTimer = explodeTimerMax;
			}
			#endregion
		}
		else
		{
			#region Knockback Active
			explodeTimer = 0;
			
			#region Revert Back
			if ((knockbackTimer == -1) and (knockbackCheckTimer == -1) and (grounded)) knockbackTimer = knockbackTimerMax;
			#endregion
			#endregion
		}
		
		#region Explode Timer
		if (explodeTimer != -1)
		{
			explodeTimer = max(explodeTimer - speedMultFinal,0);
			if (explodeTimer == 0)
			{
				deathTimer = 0;
				
				explodeTimer = -1;
			}
		}
		#endregion
		
		#region Animation
		if ((hurtTimer == -1) and (hp > 0))
		{
			sprite_index = spriteSet.sprIdle;
		}
		else
		{
			sprite_index = sprHurt[hurtFrame][0];
		}
		#endregion
	}
}
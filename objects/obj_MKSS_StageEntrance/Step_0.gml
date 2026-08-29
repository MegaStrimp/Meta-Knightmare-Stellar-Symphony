///@description Main

if (isActive)
{
	#region Selection
	if (input_check_pressed("A",playerNum))
	{
		var sfx = scr_PlaySfx(snd_MKSS_DoorEnter);
		//audio_sound_pitch(sfx,random_range(.85,1.15));
		
		if (targetRoom != -1) scr_GoToRoom(targetRoom,false);
	}
	
	if (input_check_pressed("B",playerNum))
	{
		var sfx = scr_PlaySfx(snd_MKSS_ButtonNo);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		global.hasHud = true;
		
		with (ownerPedestal) isActive = false;
		with (obj_Player)
		{
			hasAttackAnimation = false;
			
			if (playerNum == other.playerNum)
			{
				isPaused = false;
			}
		}
		
		particleTimer = -1;
		isActive = false;
	}
	#endregion
	
	if (canTeleport)
	{
		if (input_check_pressed("L",playerNum))
		{
			var sfx = scr_PlaySfx(snd_MKSS_ButtonChange);
			audio_sound_pitch(sfx,random_range(.85,1.15));
		
			var pedestalList = obj_MKSS_Pedestal_Controller.pedestalList;
			var pedestalListSize = ds_list_size(pedestalList);
			var targetPedestal = ds_list_find_value(pedestalList,(ds_list_find_index(pedestalList,ownerPedestal) + 1 + pedestalListSize) % pedestalListSize);
			
			global.hasHud = true;
			
			with (ownerPedestal) isActive = false;
			with (obj_Player)
			{
				hasAttackAnimation = false;
				
				if (playerNum == other.playerNum)
				{
					x = targetPedestal.x;
					y = targetPedestal.y - 16;
				}
			}
			with (obj_MKSS_Familiar)
			{
				x = followedObject.x - (24 * followedObject.dirX);
				y = followedObject.y - 24;
			}
			with (targetPedestal)
			{
				targetPlayer = other.ownerPedestal.targetPlayer;
				if (activationScript != -1) script_execute(activationScript);
			}
			
			particleTimer = -1;
			isActive = false;
		}
	
		if (input_check_pressed("R",playerNum))
		{
			var sfx = scr_PlaySfx(snd_MKSS_ButtonChange);
			audio_sound_pitch(sfx,random_range(.85,1.15));
		
			var pedestalList = obj_MKSS_Pedestal_Controller.pedestalList;
			var pedestalListSize = ds_list_size(pedestalList);
			var targetPedestal = ds_list_find_value(pedestalList,(ds_list_find_index(pedestalList,ownerPedestal) - 1 + pedestalListSize) % pedestalListSize);
			
			global.hasHud = true;
			
			with (ownerPedestal) isActive = false;
			with (obj_Player)
			{
				if (playerNum == other.playerNum)
				{
					hasAttackAnimation = false;
					
					x = targetPedestal.x;
					y = targetPedestal.y - 16;
				}
			}
			with (obj_MKSS_Familiar)
			{
				x = followedObject.x - (24 * followedObject.dirX);
				y = followedObject.y - 24;
			}
			with (targetPedestal)
			{
				targetPlayer = other.ownerPedestal.targetPlayer;
				if (activationScript != -1) script_execute(activationScript);
			}
			
			particleTimer = -1;
			isActive = false;
		}
	}
}

if (!localPause)
{
	#region Circle Animation
	circleIndex = (circleIndex + circleSpeed) % circleNumber;
	circleRadius = lerp(circleRadius,.2 + (.8 * isActive),.05);
	circleAngleWave = sine_wave(current_time / 4000,5,5,0);
	#endregion
	
	#region Particle Timer
	if (particleTimer != -1)
	{
		particleTimer = max(particleTimer - speedMultFinal,0);
		if (particleTimer == 0)
		{
			scr_MKSS_ParticleSet_StageIntroStars(x + irandom_range(-12,12),y - 36 + irandom_range(-8,8),irandom_range(60,120));
		
			particleTimer = particleTimerMax;
		}
	}
	#endregion
}

#region Button Input Timers
scr_Component_ButtonInputTimer_Step();
#endregion
///@description Main

if (!localPause)
{
	#region Variables
	var flag_Spawn = false;
	#endregion
	
	#region Play End Sound
	if (playEndSound)
	{
		global.hasHud = false;
		global.canGamePause = false;
		
		scr_PlaySfx(snd_MKSS_Miniboss_Death);
		
		scr_Camera_SetScreenshake(2);
		
		if (endsTheStage) scr_Music_SetFade(0);
		
		playEndSound = false;
	}
	#endregion
	
	#region Active Timer
	if (activeTimer != -1)
	{
		activeTimer = max(activeTimer - speedMultFinal,0);
		if (activeTimer == 0)
		{
			activeTimer = -1;
		}
	}
	#endregion
	
	#region End Timer
	if (endTimer != -1)
	{
		endTimer = max(endTimer - speedMultFinal,0);
		if (endTimer == 0)
		{
			if (cameraFollows)
			{
				with (obj_Player)
				{
					if (playerNum == 0)
					{
						scr_Camera_FollowObject(id,cameraXOffset + global.hudCameraXOffset,cameraYOffset + global.hudCameraYOffset);
					}
				}
			}
			
			if (cameraSetsLimits) scr_Camera_SetLimits();
			
			for (var i = 0; i < array_length(objectsToDestroy); i++)
			{
				instance_destroy(objectsToDestroy[i]);
			}
			
			if (endsTheStage)
			{
				if (endsTheStage_TargetRoom == -1)
				{
					scr_Music_SetFade(1,,1);
					
					scr_MKSS_Stage_Clear();
				}
				else
				{
					scr_GoToRoom(endsTheStage_TargetRoom,true);
				}
			}
			else
			{
				global.hasHud = true;
				global.canGamePause = true;
			}
			
			if (endScript != -1) script_execute(endScript);
			
			instance_destroy();
			
			endTimer = -1;
		}
	}
	#endregion
	
	if ((activeTimer == -1) and (!arenaEnded))
	{
		#region Spawn Timer
		if (spawnTimer != -1)
		{
			spawnTimer = max(spawnTimer - speedMultFinal,0);
			if (spawnTimer == 0)
			{
				flag_Spawn = true;
				
				spawnTimer = -1;
			}
		}
		else if (spawnedEnemyCount == 0)
		{
			flag_Spawn = true;
		}
		#endregion
		
		#region Spawn
		if (flag_Spawn)
		{
			spawnList_CurrentIndex += 1;
			
			if ((spawnList_CurrentIndex) >= (array_length(spawnList)))
			{
				arenaEnded = true;
				
				playEndSound = true;
				
				scr_PlaySfx(snd_MKSS_Boss_Death1);
				
				scr_SetGlobalFreezeFrame(60);
				scr_MKSS_UI_BackgroundOverlay_Create(60,layer_get_depth("Player") + 1,false,[c_red,c_black,c_white],10);
				
				endTimer = endTimerMax;
			}
			else
			{
				spawnedEnemyCount += 1;
				
				var enemyStruct = spawnList[spawnList_CurrentIndex];
				
				with (instance_create_layer(enemyStruct.enemyX,enemyStruct.enemyY,"Enemies",obj_EnemySpawner))
				{
					owner = other;
					
					enemyObject = enemyStruct.enemyObject;
					
					enemyAISetup = enemyStruct.enemyAISetup;
					enemyAISetupArg = enemyStruct.enemyAISetupArg;
					
					dirX = enemyStruct.dirX;
					dirY = enemyStruct.dirY;
					scale = enemyStruct.scale;
					
					spawnTimer = enemyStruct.spawnTimer;
					enemyHasSpawner = false;
					destroyAfterSpawning = true;
					
					scr_MKSS_ParticleSet_EnemySpawn(x,y,spawnTimer);
				}
				
				spawnTimer = enemyStruct.nextTimer;
			}
		}
		#endregion
	}
}
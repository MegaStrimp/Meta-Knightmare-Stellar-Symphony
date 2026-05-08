///@description MKSS - Player - Meta Knight - Step

function scr_MKSS_Player_MetaKnight_Step()
{
	if (!localPause)
	{
		#region Change Ability
		if ((ds_list_size(global.MKSS_PlayerWeaponList[playerNum]) > 1) and (!global.MKSS_CutsceneStopMovement))
		{
			var changeDir = (input_check_pressed("R",playerNum)) - (input_check_pressed("L",playerNum));
			
			if (changeDir != 0)
			{
				global.flag_MKSS_AbilitySwitch = true;
				
				scr_PlaySfx(snd_MKSS_AbilitySwitch);
				
				scr_MKSS_ParticleSet_EnemyDefeatStars(x,y);
				
				global.MKSS_PlayerWeaponList_Index[playerNum] = (global.MKSS_PlayerWeaponList_Index[playerNum] + changeDir + ds_list_size(global.MKSS_PlayerWeaponList[playerNum])) % ds_list_size(global.MKSS_PlayerWeaponList[playerNum]);
				
				var currentIndex = ds_list_find_value(global.MKSS_PlayerWeaponList[playerNum],global.MKSS_PlayerWeaponList_Index[playerNum]);
				global.playerAbility[playerNum] = currentIndex;
			}
		
			var canChangeAbility = true;
			if ((hurtState == hurtStates.hurt) or
			(isAttacking)) canChangeAbility = false;
		
			var globalAbility = global.playerAbility[playerNum];
			if ((currentAbility != globalAbility) and (canChangeAbility))
			{
				scr_Player_ChangeAbility(id,globalAbility);
				weaponSpriteSet = global.MKSS_WeaponList[globalAbility].spriteSet;
				script_execute(global.MKSS_WeaponList[globalAbility].setupScript);
				attackCooldown = -1;
			}
		}
		#endregion
	
		#region Tutorial Text
		#region Alpha
		tutorialTextAlpha = lerp(tutorialTextAlpha,tutorialTextAlphaTarget,.2);
		#endregion
	
		#region Tutorial Text Timer
		if (tutorialTextTimer != -1)
		{
			tutorialTextTimer = max(tutorialTextTimer - speedMultFinal,0);
			if (tutorialTextTimer == 0)
			{
				tutorialTextAlphaTarget = 0;
			
				tutorialTextTimer = -1;
			}
		}
		#endregion
		#endregion
		
		#region Meta Point Flash Timer
		if (metaPointFlashTimer != -1)
		{
			metaPointFlashTimer = max(metaPointFlashTimer - speedMultFinal,0);
			if (metaPointFlashTimer == 0)
			{
				metaPointFlashTimer = -1;
			}
		}
		#endregion
		
		#region Parry
		#region Parry Cooldown Timer
		if (parryCooldownTimer != -1)
		{
			parryCooldownTimer = max(parryCooldownTimer - speedMultFinal,0);
			if (parryCooldownTimer == 0)
			{
				parryCooldownFlashTimer = parryCooldownFlashTimerMax;
			
				parryCooldownTimer = -1;
			}
		}
		#endregion
		
		#region Parry Cooldown Flash Timer
		if (parryCooldownFlashTimer != -1)
		{
			parryCooldownFlashTimer = max(parryCooldownFlashTimer - speedMultFinal,0);
			if (parryCooldownFlashTimer == 0)
			{
				parryCooldownFlashTimer = -1;
			}
		}
		#endregion
		
		#region Can Parry Attack Timer
		if (canParryAttackTimer != -1)
		{
			canParryAttackTimer = max(canParryAttackTimer - speedMultFinal,0);
			if (canParryAttackTimer == 0)
			{
				canParryAttackTimer = -1;
			}
		}
		#endregion
		#endregion
	}
	
	#region Parry Attack Buffer
	if ((parryAttackBuffer) and (input_check_pressed("B",playerNum)))
	{
		canParryAttackTimer = -1;
		parryAttackFlag = true;
	}
	#endregion
}
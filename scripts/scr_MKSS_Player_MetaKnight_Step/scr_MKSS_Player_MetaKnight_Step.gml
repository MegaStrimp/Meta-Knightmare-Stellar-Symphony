///@description MKSS - Player - Meta Knight - Step

function scr_MKSS_Player_MetaKnight_Step()
{
	#region Variables
	var inMetaQuick = obj_MKSS_Control.playerMetaQuickTimer[playerNum] != -1;
	#endregion
	
	if (!localPause)
	{
		#region Change Ability
		if ((ds_list_size(global.MKSS_PlayerWeaponList[playerNum]) > 1) and (!global.MKSS_CutsceneStopMovement))
		{
			var changeDir = (input_check_pressed("R",playerNum)) - (input_check_pressed("L",playerNum));
			
			if (changeDir != 0)
			{
				global.flag_MKSS_AbilitySwitch = true;
				
				var sfx = scr_PlaySfx(snd_MKSS_AbilitySwitch);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
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
		
		#region Afterimage
		var hasAfterimage = (inMetaQuick);
		
		if ((afterimageTimer == -1) and (hasAfterimage)) afterimageTimer = afterimageTimerMax;
		
		#region Afterimage Timer
		if (afterimageTimer != -1)
		{
			afterimageTimer = max(afterimageTimer - speedMultFinal,0);
			if (afterimageTimer == 0)
			{
				scr_MKSS_ParticleSet_Afterimage(,,,,,,,palSpriteFinal,palIndexFinal);
				
				afterimageTimer = -1;
			}
		}
		#endregion
		#endregion
		
		#region Meta Heal
		if ((metaHealParticleAmount != -1) and (metaHealParticleTimer == -1))
		{
			metaHealParticleTimer = metaHealParticleTimerMax;
			metaHealSparkleTimer = metaHealSparkleTimerMax;
		}
		
		#region Meta Heal Particle Timer
		if (metaHealParticleTimer != -1)
		{
			metaHealParticleTimer = max(metaHealParticleTimer - speedMultFinal,0);
			if (metaHealParticleTimer == 0)
			{
				scr_MKSS_ParticleSet_MetaHeal(x,y + 8);
				
				metaHealParticleAmount += 1;
				if (metaHealParticleAmount == metaHealParticleAmountMax) metaHealParticleAmount = -1;
				
				metaHealParticleTimer = -1;
			}
		}
		#endregion
		
		#region Meta Heal Sparkle Timer
		if (metaHealSparkleTimer != -1)
		{
			metaHealSparkleTimer = max(metaHealSparkleTimer - speedMultFinal,0);
			if (metaHealSparkleTimer == 0)
			{
				scr_MKSS_ParticleSet_SpecialSparkle(x,y,spr_MKSS_Particle_SpecialSparkle_Yellow);
				
				metaHealSparkleTimer = -1;
			}
		}
		#endregion
		
		#region Meta Quick
		if ((inMetaQuick) and (metaQuickSparkleTimer == -1))
		{
			metaQuickSparkleTimer = metaQuickSparkleTimerMax;
		}
		
		#region Meta Quick Sparkle Timer
		if (metaQuickSparkleTimer != -1)
		{
			metaQuickSparkleTimer = max(metaQuickSparkleTimer - speedMultFinal,0);
			if (metaQuickSparkleTimer == 0)
			{
				scr_MKSS_ParticleSet_SpecialSparkle(x,y,spr_MKSS_Particle_SpecialSparkle_Orange);
				
				metaQuickSparkleTimer = -1;
			}
		}
		#endregion
		#endregion
	}
	
	#region Parry Attack Buffer
	var hasCounter = scr_MKSS_Player_CheckUpgrade(playerNum,"Base_Counter");
	
	if ((parryAttackBuffer) and (hasCounter) and (input_check_pressed("B",playerNum)))
	{
		canParryAttackTimer = -1;
		parryAttackFlag = true;
	}
	#endregion
}
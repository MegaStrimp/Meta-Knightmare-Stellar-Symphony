///@description Main

if (!localPause)
{
	#region Variables
	var isObtained = ((targetStageID == -1) or (targetCollectibleID == -1) or (global.MKSS_StageList[targetStageID].collectibles[targetCollectibleID].isObtained));
	
	#region Ambience
	if (!audio_is_playing(snd_MKSS_GemAmbience)) scr_PlaySfx(snd_MKSS_GemAmbience);
	#endregion
	
	#region Get Hit
	if (hp > 0)
	{
		with (obj_Attack)
		{
			if ((place_meeting(x,y,other)) and (dmg != -1) and (((!isMultiHit) and (other.lastHitProjectile != id)) or ((isMultiHit) and (multiHitFlag))))
			{
				scr_MKSS_ParticleSet_ConcentratedGemBreak(other.x,other.y,other.gemPalette);
				
				var sfx = scr_PlaySfx(snd_MKSS_GemHit);
				audio_sound_pitch(sfx,random_range(.85,1.15));
				
				other.lastHitProjectile = id;
				other.knockbackLength = other.knockbackLengthMax;
				other.knockbackAngle = knockbackAngle;
				other.shakeTimer = other.shakeTimerMax;
				other.hp -= 1;
				
				if (other.hp <= 0)
				{
					if (isObtained)
					{
						scr_MKSS_SpawnMetaPoint(50,other.x,other.y,other.depth - 1,owner,90);
					}
					else
					{
						scr_MKSS_UI_GemObtained_Create(other.gemTitle,other.unlockTitle,other.gemPalette);
						
						global.MKSS_StageList[other.targetStageID].collectibles[other.targetCollectibleID].isObtained = true;
						
						if (other.targetUnlockedStageID != -1) global.MKSS_StageList[other.targetUnlockedStageID].isUnlocked = true;
					}

					var sfx = scr_PlaySfx(snd_MKSS_GemBreak);
					audio_sound_pitch(sfx,random_range(.85,1.15));
					
					if (audio_is_playing(snd_MKSS_GemAmbience)) audio_stop_sound(snd_MKSS_GemAmbience);
					
					scr_MKSS_ParticleSet_Explosion1(other.x,other.y);
					
					instance_destroy(other);
				}
			}
		}
	}
	#endregion
	
	#region Shake Timer
	if (shakeTimer != -1)
	{
		shakeTimer = max(shakeTimer - speedMultFinal,0);
		if (shakeTimer == 0)
		{
			shakeTimer = -1;
		}
	}
	#endregion
	
	#region Knockback
	knockbackLength = lerp(knockbackLength,0,.1);
	#endregion
	
	#region Animation
	if (isObtained)
	{
		gemPalette = spr_MKSS_UI_GemObtained_Gem_Palette_Obtained;
		
		image_alpha = .5;
	}
	#endregion
}
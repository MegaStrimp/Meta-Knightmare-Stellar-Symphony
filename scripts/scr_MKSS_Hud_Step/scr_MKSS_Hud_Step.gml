///@description MKSS - Hud - Step

function scr_MKSS_Hud_Step()
{
	if (!global.pause)
	{
		#region Weapons
		var listSize = ds_list_size(global.MKSS_PlayerWeaponList[0]);
	
		if (listSize == 0)
		{
			hud_LeftIcon = undefined;
			hud_MiddleIcon = undefined;
			hud_RightIcon = undefined;
		}
		else
		{
			var currentIndex = ds_list_find_value(global.MKSS_PlayerWeaponList[0],global.MKSS_PlayerWeaponList_Index[0]);
		
			hud_MiddleIcon = global.MKSS_WeaponList[currentIndex].hudIcon;
			if (listSize > 1)
			{
				hud_LeftIcon = global.MKSS_WeaponList[(currentIndex - 1 + listSize) % listSize].hudIconSmall;
				hud_RightIcon = global.MKSS_WeaponList[(currentIndex + 1 + listSize) % listSize].hudIconSmall;
			}
		}
	
		hud_WeaponBgIndex = (hud_WeaponBgIndex + (hud_WeaponBgSpeed * speedMultFinal)) % 2;
		#endregion
	
		if (global.inStage)
		{
			#region Medal Spin Timer
			if (hud_MedalSpinTimer != -1)
			{
				hud_MedalSpinTimer = max(hud_MedalSpinTimer - speedMultFinal,0);
				if (hud_MedalSpinTimer == 0)
				{
					hud_MedalSpeedMult = 3;
					
					hud_MedalSpinTimer = -1;
				}
			}
			else if (hud_MedalTier != -1) hud_MedalSpinTimer = hud_MedalSpinTimerMax;
			#endregion
			
			#region Medal
			if (hud_MedalSpeedMult != 0)
			{
				hud_MedalIndex = (hud_MedalIndex + (hud_MedalSpeed * hud_MedalSpeedMult * speedMultFinal)) % hud_MedalNumber;
			
				hud_MedalSpeedMult = lerp(hud_MedalSpeedMult,1,.05);
				if ((hud_MedalSpeedMult <= 1.25) and (floor(hud_MedalIndex) == 0)) hud_MedalSpeedMult = 0;
			}
		
			for (var i = 0; i < max(0,hud_MedalTier); i++)
			{
				hud_MedalSparkleY[i] += hud_MedalSparkleVsp[i];
			
				if (hud_MedalSparkleY[i] >= hud_MedalSparkleYMax)
				{
					hud_MedalSparkleX[i] = irandom_range(0,hud_MedalSparkleXMax);
					hud_MedalSparkleY[i] = 0;
					hud_MedalSparkleVsp[i] = random_range(hud_MedalSparkleVspMin,hud_MedalSparkleVspMax);
				}
			}
		
			hud_MedalSparkleIndex = (hud_MedalSparkleIndex + (hud_MedalSparkleSpeed * speedMultFinal)) % hud_MedalSparkleNumber;
			#endregion
		}
	}
}
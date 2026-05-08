///@description Main

if (!localPause)
{
	#region Activate
	with (obj_Player)
	{
		if (place_meeting(x,y,other))
		{
			scr_PlaySfx(snd_MKSS_AbilitySwitch);
			
			//global.MKSS_PlayerUpgrade[MKSS_PlayerAbilities.galaxia][0] = true; STRIMPTODO
			scr_Camera_SetLimits(-1,-1,-1,-1);
			global.MKSS_WeaponList[other.weaponID].isUnlocked = true;
			scr_MKSS_Player_SetWeapons();
			
			global.playerAbility[playerNum] = other.weaponID;
			scr_Player_ChangeAbility(id,global.playerAbility[playerNum]);
			weaponSpriteSet = global.MKSS_WeaponList[other.weaponID].spriteSet;
			script_execute(global.MKSS_WeaponList[other.weaponID].setupScript);
			
			instance_destroy(other);
		}
	}
	#endregion
}

#region Animation
sprite_index = global.MKSS_WeaponList[weaponID].spriteSet.sprSwordGrounded;
image_speed = speedMultFinal * !localPause;
#endregion
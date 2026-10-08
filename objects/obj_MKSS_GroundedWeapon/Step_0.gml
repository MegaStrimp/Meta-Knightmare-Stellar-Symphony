///@description Main

if (!localPause)
{
	#region Activate
	with (obj_Player)
	{
		if (place_meeting(x,y,other))
		{
			var sfx = scr_PlaySfx(snd_MKSS_AbilitySwitch);
			audio_sound_pitch(sfx,random_range(.85,1.15));
			
			scr_Camera_SetLimits(-1,-1,-1,-1);
			scr_MKSS_Player_UnlockWeapon(playerNum,other.weaponID);
			
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
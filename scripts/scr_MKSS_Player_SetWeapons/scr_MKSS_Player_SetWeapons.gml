///@description MKSS - Player - Set Weapons

function scr_MKSS_Player_SetWeapons()
{
	#region Setup
	ds_list_clear(global.MKSS_PlayerWeaponList[playerNum]);
	#endregion
	
	for (var i = 0; i < ds_map_size(global.MKSS_WeaponIDs); i++)
	{
		var currentWeapon = global.MKSS_WeaponList[i];
		
		if (currentWeapon.isUnlocked)
		{
			ds_list_add(global.MKSS_PlayerWeaponList[playerNum],i);
			
			if (currentAbility == -1)
			{
				global.playerAbility[playerNum] = i;
				scr_Player_ChangeAbility(id,global.playerAbility[playerNum]);
				weaponSpriteSet = global.MKSS_WeaponList[i].spriteSet;
				script_execute(global.MKSS_WeaponList[i].setupScript);
			}
		}
	}
}
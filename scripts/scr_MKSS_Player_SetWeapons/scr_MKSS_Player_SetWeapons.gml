///@description MKSS - Player - Set Weapons

function scr_MKSS_Player_SetWeapons(playerNum = 0)
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
		}
	}
	
	with (obj_Player)
	{
		if (ds_list_find_index(global.MKSS_PlayerWeaponList[playerNum],currentAbility) == -1)
		{
			var targetAbility = ds_list_find_value(global.MKSS_PlayerWeaponList[playerNum],0);
			
			global.playerAbility[playerNum] = targetAbility;
			scr_Player_ChangeAbility(id,global.playerAbility[playerNum]);
			global.MKSS_PlayerWeaponList_Index[playerNum] = 0;
			weaponSpriteSet = global.MKSS_WeaponList[targetAbility].spriteSet;
			script_execute(global.MKSS_WeaponList[targetAbility].setupScript);
		}
	}
}
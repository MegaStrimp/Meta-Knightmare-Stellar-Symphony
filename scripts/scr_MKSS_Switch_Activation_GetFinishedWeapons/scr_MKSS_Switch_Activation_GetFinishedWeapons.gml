///@description MKSS - Switch - Activation - Get Finished Weapons

function scr_MKSS_Switch_Activation_GetFinishedWeapons()
{
	for (var i = 0; i < 2; i++)
	{
		global.MKSS_WeaponList[i].isUnlocked = true;
	}
	
	with (obj_Player) if (playerNum == 0) scr_MKSS_Player_SetWeapons();
}
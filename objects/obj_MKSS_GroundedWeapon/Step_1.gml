///@description Begin Step

#region Destroy
if (destroyCheck)
{
	if (global.MKSS_WeaponList[weaponID].isUnlocked) instance_destroy();
	destroyCheck = false;
}
#endregion

#region Variables
speedMultFinal = global.speedMultGlobal * global.speedMultEnvironment * global.deltaTime;
localPause = global.pauseFinal;
#endregion
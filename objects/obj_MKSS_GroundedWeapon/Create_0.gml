///@description Create

#region Initialize Variables
#region Object Attributes
speedMultFinal = 1;
localPause = false;
weaponID = global.MKSS_WeaponIDs[? "galaxia"];
#endregion
#endregion

#region Destroy
if (global.MKSS_WeaponList[weaponID].isUnlocked) instance_destroy();
#endregion
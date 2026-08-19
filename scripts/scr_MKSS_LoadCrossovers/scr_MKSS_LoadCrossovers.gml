///@description MKSS - Load Crossovers

function scr_MKSS_LoadCrossovers(file)
{
	#region Check Saves
	//STRIMPTODO Doesn't work on mobile
	
	var hasKSWSave = false;
	var hasWaddleKnightSave = false;
	
	if (!global.isMobile)
	{
		hasKSWSave = file_exists(environment_get_variable("LOCALAPPDATA") + chr(92) + "Kirby ~ Soft & Wet" + chr(92) + "data1.ini");
		
		hasWaddleKnightSave = file_exists(environment_get_variable("LOCALAPPDATA") + chr(92) + "Waddle Knight Deluxe" + chr(92) + "data1.ini");
	}
	#endregion
	
	var fileFinal = file;
	if (!global.isMobile) fileFinal = environment_get_variable("LOCALAPPDATA") + chr(92) + global.gameTitle + chr(92) + file;
	
	if (file_exists(fileFinal))
	{
		file_copy(fileFinal,string(fileFinal) + "_bak");
	}
	
	ini_open(fileFinal);
	
	#region Familiar Status
	if (hasKSWSave) ini_write_real("familiarStatus","ksw_IsUnlocked",true);
	if (hasWaddleKnightSave) ini_write_real("familiarStatus","waddleKnight_IsUnlocked",true);
	#endregion
	
	ini_close();
}
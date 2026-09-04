///@description MKSS - Set Familiars

function scr_MKSS_Familiar_Init_Set()
{
	#region Setup
	global.MKSS_FamiliarList = [];
	global.MKSS_FamiliarIDs = ds_map_create();
	global.MKSS_HiddenFamiliarCount = 0;
	#endregion
	
	#region Familiars
	scr_MKSS_Familiar_Init_Add("none","None");
	global.MKSS_FamiliarList[global.MKSS_FamiliarIDs[? "none"]].isDefault = true;
	scr_MKSS_Familiar_Init_Add("starryShores","Stage 1 Familiar");
	scr_MKSS_Familiar_Init_Add("royalReeve","Stage 2 Familiar");
	scr_MKSS_Familiar_Init_Add("livingLoom","Stage 3 Familiar");
	scr_MKSS_Familiar_Init_Add("fissionFactory","Stage 4 Familiar");
	scr_MKSS_Familiar_Init_Add("adAstra","Stage 5 Familiar");
	
	scr_MKSS_Familiar_Init_Add("nightmare","Nightmare");
	scr_MKSS_Familiar_Init_Add("marx","Marx");
	scr_MKSS_Familiar_Init_Add("zeroTwo","Zero Two");
	scr_MKSS_Familiar_Init_Add("darkMind","Dark Mind");
	scr_MKSS_Familiar_Init_Add("darkNebula","Dark Nebula");
	
	scr_MKSS_Familiar_Init_Add("ksw","Bubble Fish",spr_MKSS_Familiar_SoftAndWet,true);
	scr_MKSS_Familiar_Init_Add("waddleKnight","Bronto Burt",spr_MKSS_Familiar_WaddleKnight,true);
	#endregion
}
///@description MKSS - Set Familiars

function scr_MKSS_Familiar_Init_Set()
{
	#region Setup
	global.MKSS_FamiliarList = [];
	global.MKSS_FamiliarIDs = ds_map_create();
	#endregion
	
	#region Familiars
	scr_MKSS_Familiar_Init_Add("stage1","Stage 1 Familiar");
	scr_MKSS_Familiar_Init_Add("stage2","Stage 2 Familiar");
	scr_MKSS_Familiar_Init_Add("stage3","Stage 3 Familiar");
	scr_MKSS_Familiar_Init_Add("stage4","Stage 4 Familiar");
	scr_MKSS_Familiar_Init_Add("stage5","Stage 5 Familiar");
	scr_MKSS_Familiar_Init_Add("boss1","Boss 1 Familiar");
	scr_MKSS_Familiar_Init_Add("boss2","Boss 2 Familiar");
	scr_MKSS_Familiar_Init_Add("boss3","Boss 3 Familiar");
	scr_MKSS_Familiar_Init_Add("boss4","Boss 4 Familiar");
	scr_MKSS_Familiar_Init_Add("boss5","Boss 5 Familiar");
	#endregion
}
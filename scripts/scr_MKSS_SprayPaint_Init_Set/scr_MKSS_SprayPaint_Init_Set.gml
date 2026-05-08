///@description MKSS - Spray Paint - Init - Set

function scr_MKSS_SprayPaint_Init_Set()
{
	#region Setup
	global.MKSS_SprayPaintList = [];
	global.MKSS_SprayPaintIDs = ds_map_create();
	#endregion
	
	#region Spray Paints
	scr_MKSS_SprayPaint_Init_Add("meta","Meta",spr_MKSS_SprayPaint_Meta);
	scr_MKSS_SprayPaint_Init_Add("starry","Starry",spr_MKSS_SprayPaint_Starry);
	scr_MKSS_SprayPaint_Init_Add("royal","Royal",spr_MKSS_SprayPaint_Royal);
	scr_MKSS_SprayPaint_Init_Add("living","Living",spr_MKSS_SprayPaint_Living);
	scr_MKSS_SprayPaint_Init_Add("fission","Fission",spr_MKSS_SprayPaint_Fission);
	scr_MKSS_SprayPaint_Init_Add("astra","Astra",spr_MKSS_SprayPaint_Astra);
	scr_MKSS_SprayPaint_Init_Add("wizard","Wizard",spr_MKSS_SprayPaint_Wizard);
	scr_MKSS_SprayPaint_Init_Add("jester","Jester",spr_MKSS_SprayPaint_Jester);
	scr_MKSS_SprayPaint_Init_Add("nebula","Nebula",spr_MKSS_SprayPaint_Nebula);
	scr_MKSS_SprayPaint_Init_Add("superstar","Superstar",spr_MKSS_SprayPaint_Superstar);
	scr_MKSS_SprayPaint_Init_Add("aeon","Aeon",spr_MKSS_SprayPaint_Aeon);
	scr_MKSS_SprayPaint_Init_Add("mirror","Mirror",spr_MKSS_SprayPaint_Mirror);
	#endregion
}
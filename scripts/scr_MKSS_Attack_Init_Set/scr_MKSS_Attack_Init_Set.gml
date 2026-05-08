///@description MKSS - Attack - Init - Set

function scr_MKSS_Attack_Init_Set()
{
	#region Setup
	global.MKSS_AttackList = [];
	global.MKSS_AttackIDs = ds_map_create();
	#endregion
	
	#region Attacks
	#region Meta Knight
	scr_MKSS_Attack_Init_Add("metaKnight_Slide",scr_MKSS_Attack_Execute_MetaKnight_Slide);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryChunkyGordo",scr_MKSS_Attack_Execute_MetaKnight_ParryChunkyGordo);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryTrappyPearl",scr_MKSS_Attack_Execute_MetaKnight_ParryTrappyPearl);
	#endregion
	
	#region Galaxia
	scr_MKSS_Attack_Init_Add("galaxia_Chop",scr_MKSS_Attack_Execute_Galaxia_Chop);
	scr_MKSS_Attack_Init_Add("galaxia_Kick",scr_MKSS_Attack_Execute_Galaxia_Kick);
	scr_MKSS_Attack_Init_Add("galaxia_Multisword",scr_MKSS_Attack_Execute_Galaxia_Multisword);
	scr_MKSS_Attack_Init_Add("galaxia_Stab",scr_MKSS_Attack_Execute_Galaxia_Stab);
	scr_MKSS_Attack_Init_Add("galaxia_Finisher",scr_MKSS_Attack_Execute_Galaxia_Finisher);
	scr_MKSS_Attack_Init_Add("galaxia_UpThrust",scr_MKSS_Attack_Execute_Galaxia_UpThrust);
	scr_MKSS_Attack_Init_Add("galaxia_DownThrust",scr_MKSS_Attack_Execute_Galaxia_DownThrust);
	//scr_MKSS_Attack_Init_Add("galaxia_MachTornado",scr_MKSS_Attack_Execute_Galaxia_MachTornado);
	#endregion
	
	#region Buzzcut
	scr_MKSS_Attack_Init_Add("buzzcut_Slash1",scr_MKSS_Attack_Execute_Buzzcut_Slash1);
	scr_MKSS_Attack_Init_Add("buzzcut_Slash2",scr_MKSS_Attack_Execute_Buzzcut_Slash2);
	scr_MKSS_Attack_Init_Add("buzzcut_Finisher",scr_MKSS_Attack_Execute_Buzzcut_Finisher);
	#endregion
	
	#region Peezer
	scr_MKSS_Attack_Init_Add("peezer_Claw",scr_MKSS_Attack_Execute_Peezer_Claw);
	#endregion
	
	#region Ghost Knight
	scr_MKSS_Attack_Init_Add("ghostKnight_Stab",scr_MKSS_Attack_Execute_GhostKnight_Stab);
	scr_MKSS_Attack_Init_Add("ghostKnight_Parry",scr_MKSS_Attack_Execute_GhostKnight_Parry);
	#endregion
	
	#region Trappy
	scr_MKSS_Attack_Init_Add("trappy_Pearl",scr_MKSS_Attack_Execute_Trappy_Pearl);
	#endregion
	
	#region Chunky Dee
	scr_MKSS_Attack_Init_Add("chunkyDee_Walk",scr_MKSS_Attack_Execute_ChunkyDee_Walk);
	scr_MKSS_Attack_Init_Add("chunkyDee_Jump",scr_MKSS_Attack_Execute_ChunkyDee_Jump);
	scr_MKSS_Attack_Init_Add("chunkyDee_Dash",scr_MKSS_Attack_Execute_ChunkyDee_Dash);
	scr_MKSS_Attack_Init_Add("chunkyDee_ThrowDee",scr_MKSS_Attack_Execute_ChunkyDee_ThrowDee);
	scr_MKSS_Attack_Init_Add("chunkyDee_ThrowGordo",scr_MKSS_Attack_Execute_ChunkyDee_ThrowGordo);
	#endregion
	
	#region Starless Marx
	scr_MKSS_Attack_Init_Add("starlessMarx_FlyingApparition",scr_MKSS_Attack_Execute_StarlessMarx_FlyingApparition);
	scr_MKSS_Attack_Init_Add("starlessMarx_ShooterCutter_Ready",scr_MKSS_Attack_Execute_StarlessMarx_ShooterCutter);
	scr_MKSS_Attack_Init_Add("starlessMarx_ShooterCutter",scr_MKSS_Attack_Execute_StarlessMarx_ShooterCutter);
	scr_MKSS_Attack_Init_Add("starlessMarx_MarxCannon",scr_MKSS_Attack_Execute_StarlessMarx_ShooterCutter);
	#endregion
	#endregion
}
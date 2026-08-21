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
	scr_MKSS_Attack_Init_Add("metaKnight_ParryChunkyWaddleDee",scr_MKSS_Attack_Execute_MetaKnight_ParryChunkyWaddleDee);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryChunkyGordo",scr_MKSS_Attack_Execute_MetaKnight_ParryChunkyGordo);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryTrappyPearl",scr_MKSS_Attack_Execute_MetaKnight_ParryTrappyPearl);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryRangoSpin",scr_MKSS_Attack_Execute_MetaKnight_ParryRangoSpin);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryCannonball",scr_MKSS_Attack_Execute_MetaKnight_ParryCannonball);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryBigCannonball",scr_MKSS_Attack_Execute_MetaKnight_ParryBigCannonball);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryStarlessMarxCutter",scr_MKSS_Attack_Execute_MetaKnight_ParryStarlessMarxCutter);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryIceBomb",scr_MKSS_Attack_Execute_MetaKnight_ParryIceBomb);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryMarxArrow",scr_MKSS_Attack_Execute_MetaKnight_ParryMarxArrow);
	scr_MKSS_Attack_Init_Add("metaKnight_ParryWheelie",scr_MKSS_Attack_Execute_MetaKnight_ParryWheelie);
	#endregion
	
	#region Galaxia
	scr_MKSS_Attack_Init_Add("galaxia_Chop",scr_MKSS_Attack_Execute_Galaxia_Chop);
	scr_MKSS_Attack_Init_Add("galaxia_Kick",scr_MKSS_Attack_Execute_Galaxia_Kick);
	scr_MKSS_Attack_Init_Add("galaxia_Multisword",scr_MKSS_Attack_Execute_Galaxia_Multisword);
	scr_MKSS_Attack_Init_Add("galaxia_Stab",scr_MKSS_Attack_Execute_Galaxia_Stab);
	scr_MKSS_Attack_Init_Add("galaxia_Finisher",scr_MKSS_Attack_Execute_Galaxia_Finisher);
	scr_MKSS_Attack_Init_Add("galaxia_UpThrust",scr_MKSS_Attack_Execute_Galaxia_UpThrust);
	scr_MKSS_Attack_Init_Add("galaxia_DownThrust",scr_MKSS_Attack_Execute_Galaxia_DownThrust);
	scr_MKSS_Attack_Init_Add("galaxia_MachTornado",scr_MKSS_Attack_Execute_Galaxia_MachTornado);
	scr_MKSS_Attack_Init_Add("galaxia_CircleSlash",scr_MKSS_Attack_Execute_Galaxia_CircleSlash);
	#endregion
	
	#region Buzzcut
	scr_MKSS_Attack_Init_Add("buzzcut_Slash1",scr_MKSS_Attack_Execute_Buzzcut_Slash1);
	scr_MKSS_Attack_Init_Add("buzzcut_Slash2",scr_MKSS_Attack_Execute_Buzzcut_Slash2);
	scr_MKSS_Attack_Init_Add("buzzcut_Finisher",scr_MKSS_Attack_Execute_Buzzcut_Finisher);
	scr_MKSS_Attack_Init_Add("buzzcut_Chainlings",scr_MKSS_Attack_Execute_Buzzcut_Chainlings);
	#endregion
	
	#region Peezer
	scr_MKSS_Attack_Init_Add("peezer_Claw",scr_MKSS_Attack_Execute_Peezer_Claw);
	#endregion
	
	#region Ghost Knight
	scr_MKSS_Attack_Init_Add("ghostKnight_Stab");
	scr_MKSS_Attack_Init_Add("ghostKnight_Parry");
	scr_MKSS_Attack_Init_Add("ghostKnight_Counter");
	#endregion
	
	#region Trappy
	scr_MKSS_Attack_Init_Add("trappy_Pearl",scr_MKSS_Attack_Execute_Trappy_Pearl);
	#endregion
	
	#region Rango
	scr_MKSS_Attack_Init_Add("rango_Jump",scr_MKSS_Attack_Execute_Rango_Jump);
	#endregion
	
	#region Ghoul Knight
	scr_MKSS_Attack_Init_Add("ghoulKnight_Stab");
	scr_MKSS_Attack_Init_Add("ghoulKnight_Parry");
	scr_MKSS_Attack_Init_Add("ghoulKnight_Counter");
	#endregion
	
	#region Bouncy
	scr_MKSS_Attack_Init_Add("bouncy_Spin");
	#endregion
	
	#region Keke
	scr_MKSS_Attack_Init_Add("keke_Throw");
	#endregion
	
	#region Waddle Doo
	scr_MKSS_Attack_Init_Add("waddleDoo_Beam");
	#endregion
	
	#region Wheelie
	scr_MKSS_Attack_Init_Add("wheelie_Charge");
	#endregion
	
	#region Bouncy Sis
	scr_MKSS_Attack_Init_Add("bouncySis_Spin");
	#endregion
	
	#region Chunky Dee
	scr_MKSS_Attack_Init_Add("chunkyDee_Walk",scr_MKSS_Attack_Execute_ChunkyDee_Walk);
	scr_MKSS_Attack_Init_Add("chunkyDee_Jump",scr_MKSS_Attack_Execute_ChunkyDee_Jump);
	scr_MKSS_Attack_Init_Add("chunkyDee_Dash",scr_MKSS_Attack_Execute_ChunkyDee_Dash);
	scr_MKSS_Attack_Init_Add("chunkyDee_ThrowDee",scr_MKSS_Attack_Execute_ChunkyDee_ThrowDee);
	scr_MKSS_Attack_Init_Add("chunkyDee_ThrowGordo",scr_MKSS_Attack_Execute_ChunkyDee_ThrowGordo);
	#endregion
	
	#region Gigant Edge
	scr_MKSS_Attack_Init_Add("gigantEdge_Walk",scr_MKSS_Attack_Execute_GigantEdge_Walk);
	scr_MKSS_Attack_Init_Add("gigantEdge_SwordSwing",scr_MKSS_Attack_Execute_GigantEdge_SwordSwing);
	scr_MKSS_Attack_Init_Add("gigantEdge_SwordDash",scr_MKSS_Attack_Execute_GigantEdge_SwordDash);
	scr_MKSS_Attack_Init_Add("gigantEdge_SwordSlam",scr_MKSS_Attack_Execute_GigantEdge_SwordSlam);
	scr_MKSS_Attack_Init_Add("gigantEdge_ChargeSwing",scr_MKSS_Attack_Execute_GigantEdge_ChargeSwing);
	scr_MKSS_Attack_Init_Add("gigantEdge_SwordThrow",scr_MKSS_Attack_Execute_GigantEdge_SwordThrow);
	#endregion
	
	#region Starless Marx
	scr_MKSS_Attack_Init_Add("starlessMarx_FlyingApparition",scr_MKSS_Attack_Execute_StarlessMarx_FlyingApparition);
	scr_MKSS_Attack_Init_Add("starlessMarx_ShooterCutter_Ready",scr_MKSS_Attack_Execute_StarlessMarx_ShooterCutter);
	scr_MKSS_Attack_Init_Add("starlessMarx_ShooterCutter",scr_MKSS_Attack_Execute_StarlessMarx_ShooterCutter);
	scr_MKSS_Attack_Init_Add("starlessMarx_MarxCannon",scr_MKSS_Attack_Execute_StarlessMarx_ShooterCutter);
	#endregion
	#endregion
}
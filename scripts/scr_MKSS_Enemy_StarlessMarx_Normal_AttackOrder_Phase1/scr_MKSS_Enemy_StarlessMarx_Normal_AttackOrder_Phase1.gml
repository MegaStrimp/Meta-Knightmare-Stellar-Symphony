///@description MKSS - Enemy - Starless Marx - Normal - Attack Order - Phase 1

function scr_MKSS_Enemy_StarlessMarx_Normal_AttackOrder_Phase1(clear = true)
{
	if (clear) ds_list_clear(attackList);
	
	//ds_list_add(attackList,marx_Attack_MarxCannon);
	
	//ds_list_add(attackList,marx_Attack_ShooterCutter);
	ds_list_add(attackList,marx_Attack_IceBomb);
	ds_list_add(attackList,marx_Attack_Teleport);
	ds_list_add(attackList,marx_Attack_ArrowArrow);
	ds_list_add(attackList,marx_Attack_SeedAttack);
	ds_list_add(attackList,marx_Attack_ShadowUppercut);
	ds_list_add(attackList,marx_Attack_Teleport);
	ds_list_add(attackList,marx_Attack_BlackHole);
	ds_list_add(attackList,marx_Attack_SpawnMinimarx);
	ds_list_add(attackList,marx_Attack_MarxCannon);
}
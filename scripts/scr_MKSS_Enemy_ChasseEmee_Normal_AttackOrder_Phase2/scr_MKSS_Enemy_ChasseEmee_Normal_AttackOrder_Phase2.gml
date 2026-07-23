///@description MKSS - Enemy - Chasse Emee - Normal - Attack Order - Phase 2

function scr_MKSS_Enemy_ChasseEmee_Normal_AttackOrder_Phase2(clear = true)
{
	if (clear) ds_list_clear(attackList);
	
	ds_list_add(attackList,chasse_Attack_HeavyDash);
}
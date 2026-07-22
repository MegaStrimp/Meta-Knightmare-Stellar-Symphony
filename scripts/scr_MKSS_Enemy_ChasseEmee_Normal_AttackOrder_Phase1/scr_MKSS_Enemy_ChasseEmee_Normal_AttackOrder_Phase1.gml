///@description MKSS - Enemy - ChasseEmee - Normal - Attack Order - Phase 1

function scr_MKSS_Enemy_ChasseEmee_Normal_AttackOrder_Phase1(clear = true)
{
	if (clear) ds_list_clear(attackList);
	
	ds_list_add(attackList,chasse_Attack_SlashCombo);
}
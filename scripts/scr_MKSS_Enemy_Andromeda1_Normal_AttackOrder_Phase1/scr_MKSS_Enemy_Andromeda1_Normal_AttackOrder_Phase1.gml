///@description MKSS - Enemy - Andromeda 1 - Normal - Attack Order - Phase 1

function scr_MKSS_Enemy_Andromeda1_Normal_AttackOrder_Phase1(clear = true)
{
	if (clear) ds_list_clear(attackList);
	
	ds_list_add(attackList,andromeda1_Attack_SlashCombo);
}
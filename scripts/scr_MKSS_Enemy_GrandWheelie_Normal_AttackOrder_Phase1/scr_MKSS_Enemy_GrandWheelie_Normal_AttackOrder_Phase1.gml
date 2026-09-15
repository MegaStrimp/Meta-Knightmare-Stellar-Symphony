///@description MKSS - Enemy - Grand Wheelie - Normal - Attack Order - Phase 1

function scr_MKSS_Enemy_GrandWheelie_Normal_AttackOrder_Phase1()
{
	ds_list_clear(attackList);
	
	ds_list_add(attackList,grandWheelie_Attack_Jump);
	ds_list_add(attackList,grandWheelie_Attack_Jump);
	ds_list_add(attackList,grandWheelie_Attack_BigRush);
}
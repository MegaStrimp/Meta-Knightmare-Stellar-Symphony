///@description MKSS - Enemy - Nimbia - Normal - Attack Order - Phase 1

function scr_MKSS_Enemy_Nimbia_Normal_AttackOrder_Phase1(clear = true)
{
	if (clear) ds_list_clear(attackList);
	
	ds_list_add(attackList,nimbia_Attack_SlashCombo);
	ds_list_add(attackList,nimbia_Attack_TornadoThrow);
	ds_list_add(attackList,nimbia_Attack_LightningSlash);
	ds_list_add(attackList,nimbia_Attack_SummonKracklets);
	ds_list_add(attackList,nimbia_Attack_TornadoThrowJump);
	ds_list_add(attackList,nimbia_Attack_SlashStrike);
	ds_list_add(attackList,nimbia_Attack_DecoyClouds);
}
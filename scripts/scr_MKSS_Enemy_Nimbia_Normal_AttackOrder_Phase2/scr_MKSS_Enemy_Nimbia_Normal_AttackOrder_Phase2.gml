///@description MKSS - Enemy - Nimbia - Normal - Attack Order - Phase 2

function scr_MKSS_Enemy_Nimbia_Normal_AttackOrder_Phase2(clear = true)
{
	if (clear) ds_list_clear(attackList);
	
	ds_list_add(attackList,nimbia_Attack_KrackoForm);
	
	ds_list_add(attackList,nimbia_Attack_LightningSlash);
	ds_list_add(attackList,nimbia_Attack_TornadoThrow);
	ds_list_add(attackList,nimbia_Attack_DecoyClouds);
	ds_list_add(attackList,nimbia_Attack_SwordForm);
	ds_list_add(attackList,nimbia_Attack_SlashCombo);	
	ds_list_add(attackList,nimbia_Attack_SummonKracklets);
	ds_list_add(attackList,nimbia_Attack_SlashStrike);
	ds_list_add(attackList,nimbia_Attack_TornadoAssault);
	ds_list_add(attackList,nimbia_Attack_TornadoThrowJump);
	ds_list_add(attackList,nimbia_Attack_LightningSlash);
	ds_list_add(attackList,nimbia_Attack_SlashCombo);
	ds_list_add(attackList,nimbia_Attack_RaijinForm);
	ds_list_add(attackList,nimbia_Attack_TornadoThrow);
	ds_list_add(attackList,nimbia_Attack_SlashStrike);
	ds_list_add(attackList,nimbia_Attack_DecoyClouds);
}
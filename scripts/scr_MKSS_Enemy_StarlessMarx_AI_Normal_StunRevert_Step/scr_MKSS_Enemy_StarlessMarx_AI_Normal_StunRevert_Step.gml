///@description MKSS - Enemy - Starless Marx - AI - Normal - Stun Revert - Step

function scr_MKSS_Enemy_StarlessMarx_AI_Normal_StunRevert_Step()
{
	scr_MKSS_Enemy_StarlessMarx_Teleport((room_width/2) + irandom_range(-32,32),72 + irandom_range(-8,8),enemyAIStepIdle,,0);
}
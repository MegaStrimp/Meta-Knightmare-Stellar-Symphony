///@description MKSS - Player - Get Stunned

function scr_MKSS_Player_GetStunned(targetPlayer)
{
	scr_PlaySfx(snd_MKSS_Stun);
	
	with (targetPlayer)
	{
		scr_Player_CancelAttack(id,attackIndex);
		
		scr_ChangeSprite(spriteSet.sprStun);
		scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Stun_Step);
	}
}
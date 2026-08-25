///@description MKSS - Player - Get Stunned

function scr_MKSS_Player_GetStunned(targetPlayer)
{
	var sfx = scr_PlaySfx(snd_MKSS_Stun);
	audio_sound_pitch(sfx,random_range(.85,1.15));
	
	with (targetPlayer)
	{
		scr_Player_CancelAttack(id,attackIndex);
		
		scr_ChangeSprite(spriteSet.sprStun);
		scr_Player_ChangePlayerState_Step(id,scr_MKSS_Player_MetaKnight_State_Stun_Step);
	}
}
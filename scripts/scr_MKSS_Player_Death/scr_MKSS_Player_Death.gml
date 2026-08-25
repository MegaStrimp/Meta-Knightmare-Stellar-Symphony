///@description MKSS - Player - Death

function scr_MKSS_Player_Death(targetPlayer)
{
	with (targetPlayer)
	{
		scr_Debug_WriteLog("Player " + string(playerNum) + " Died");
		
		audio_stop_all();
		var sfx = scr_PlaySfx(snd_MKSS_Hurt);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		global.canGamePause = false;
		
		global.MKSS_GameOverPause = true;
		
		global.playerRespawn[playerNum] = true;
		
		global.MKSS_SpecialCurrent -= 1;
		obj_MKSS_Control.specialDeflationTimer = -1;
		obj_MKSS_Control.playerMetaQuickTimer[playerNum] = -1;
		
		scr_Player_CancelAttack(id,attackIndex);
		
		global.MKSS_DeathX = x;
		global.MKSS_DeathY = y;
		
		hsp = 0;
		vsp = 0;
		hurtState = hurtStates.none;
		
		scr_Camera_SetActive(false);
		
		scr_Player_ChangePlayerState_Step(id,playerDeathState);
	}
}
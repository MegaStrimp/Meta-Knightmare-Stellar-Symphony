///@description MKSS - Player - Death

function scr_MKSS_Player_Death(targetPlayer)
{
	with (targetPlayer)
	{
		scr_Debug_WriteLog("Player " + string(playerNum) + " Died");
		
		audio_stop_all();
		scr_PlaySfx(snd_MKSS_Hurt);
		
		global.canGamePause = false;
		
		global.MKSS_GameOverPause = true;
		
		global.playerRespawn[playerNum] = true;
		
		global.MKSS_DeathX = x;
		global.MKSS_DeathY = y;
		
		hsp = 0;
		vsp = 0;
		hurtState = hurtStates.none;
		
		scr_Camera_SetActive(false);
		
		scr_Player_ChangePlayerState_Step(id,playerDeathState);
	}
}
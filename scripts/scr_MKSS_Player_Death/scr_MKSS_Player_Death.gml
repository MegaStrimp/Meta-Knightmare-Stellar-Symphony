///@description MKSS - Player - Death

function scr_MKSS_Player_Death(targetPlayer)
{
	with (targetPlayer)
	{
		scr_Debug_WriteLog("Player " + string(playerNum) + " Died");
		
		global.playerRespawn[playerNum] = true;
		
		room_restart();
	}
}
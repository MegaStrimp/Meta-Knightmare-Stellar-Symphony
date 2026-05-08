///@description MKSS - Player - Get Hit - Object

function scr_MKSS_Player_GetHit_Object(targetPlayer,targetObject)
{
	with (targetPlayer)
	{
		scr_Debug_WriteLog("Player " + string(playerNum) + " Got Hit");
		
		scr_PlaySfx(snd_MKSS_Hurt);
		
		scr_MKSS_ParticleSet_PlayerHit(x,y);
		
		var hurtDir = 1;
		if (targetObject.x > targetPlayer.x) hurtDir = -1;
		
		hsp = 2 * hurtDir * speedMultFinal;
		vsp = -2 * speedMultFinal;
		hurtState = hurtStates.hurt;
		hurtTimer = hurtTimer_Hurt;
		lastHitProjectile = targetObject;
		
		hurtElement = irandom(MKSS_HurtElements.length - 1);
		
		if (hurtElement == MKSS_HurtElements.shocked) scr_MKSS_ParticleSet_Spark(x,y,30);
		
		global.playerHp[playerNum] -= targetObject.dmg;
		if (global.playerHp[playerNum] <= 0)
		{
			if (playerDeath != -1) script_execute(playerDeath,targetPlayer);
		}
	}
}
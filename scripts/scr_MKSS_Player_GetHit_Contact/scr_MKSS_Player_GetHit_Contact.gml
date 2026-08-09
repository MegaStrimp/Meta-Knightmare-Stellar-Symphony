///@description MKSS - Player - Get Hit - Contact

function scr_MKSS_Player_GetHit_Contact(targetPlayer,targetObject)
{
	with (targetPlayer)
	{
		#region Effects
		scr_PlaySfx(snd_MKSS_Hurt);
		#endregion
		
		#region Variables
		hurtState = hurtStates.hurt;
		hurtTimer = hurtTimer_Hurt;
		#endregion
		
		#region Knockback
		var knockbackAngleFinal = point_direction(targetObject.x,targetObject.y,x,y);
		var finalKnockbackForce = max(0,2 * (random_range(1,1.1) * speedMultFinal));
		
		//scr_Enemy_ReceiveKnockback(targetPlayer,finalKnockbackForce,knockbackAngleFinal);
		hsp = lengthdir_x(finalKnockbackForce,knockbackAngleFinal);
		vsp = lengthdir_y(finalKnockbackForce,knockbackAngleFinal);
		forceJump = true;
		#endregion
		
		#region Elemental Damange Effects
		//hurtElement = targetObject.element; STRIMPTODO Refactor this to attackTypes
		
		switch (hurtElement)
		{
			default:
			scr_ChangeSprite(spriteSet.sprHurtNormal,true);
			break;
			
			case MKSS_HurtElements.shocked:
			scr_ChangeSprite(spriteSet.sprHurtShocked,true);
			break;
			
			case MKSS_HurtElements.burned:
			scr_ChangeSprite(spriteSet.sprHurtBurned,true);
			break;
			
			case MKSS_HurtElements.frozen:
			scr_ChangeSprite(spriteSet.sprHurtFrozen,true);
			break;
		}
		
		if (hurtElement == MKSS_HurtElements.shocked) scr_MKSS_ParticleSet_Spark(x,y,30);
		#endregion
		
		#region Decrease Health
		var dmgFinal = targetObject.dmg;
		
		global.playerHp[playerNum] -= dmgFinal;
		#endregion
		
		#region Death
		if (global.playerHp[playerNum] <= 0)
		{
			global.playerHp[playerNum] = 0;
			
			if (playerDeath != -1) script_execute(playerDeath,targetPlayer);
		}
		else
		{
			scr_MKSS_ParticleSet_PlayerHit(x,y);
		}
		#endregion
		
		scr_Debug_WriteLog(string(object_get_name(targetPlayer.object_index)) + " " + string_copy(string(targetPlayer.id),14,6) + " Received " + string(dmgFinal) + " Damage And " + string(finalKnockbackForce) + " Knockback At " + string(knockbackAngleFinal) + " Degrees From " + string(object_get_name(targetObject.object_index)));
	}
}
///@description MKSS - Player - Get Hit - Object

function scr_MKSS_Player_GetHit_Object(targetPlayer,targetAttack)
{
	with (targetPlayer)
	{
		#region Effects
		var sfx = scr_PlaySfx(snd_MKSS_Hurt);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		#endregion
		
		#region Variables
		hurtState = hurtStates.hurt;
		hurtTimer = hurtTimer_Hurt;
		scr_Entity_HitList_Add(id,targetAttack);
		
		global.MKSS_NoDamage = false;
		#endregion
		
		#region Knockback
		var knockbackAngleFinal = targetAttack.knockbackAngle;
		var finalKnockbackForce = max(0,(targetAttack.knockbackForce) * random_range(1,1.1) * speedMultFinal);
		
		//scr_Enemy_ReceiveKnockback(targetPlayer,finalKnockbackForce,knockbackAngleFinal);
		hsp = lengthdir_x(finalKnockbackForce,knockbackAngleFinal);
		vsp = lengthdir_y(finalKnockbackForce,knockbackAngleFinal);
		forceJump = true;
		#endregion
		
		#region Elemental Damange Effects
		ds_list_clear(MKSS_HurtElement);
		
		for (var i = 0; i < ds_list_size(targetAttack.attackTypes); i++)
		{
			var value = ds_list_find_value(targetAttack.attackTypes,i);
			
			ds_list_add(MKSS_HurtElement,value);
		}
		
		if (ds_list_find_index(MKSS_HurtElement,global.AttackTypeIDs[? "electric"]) != -1)
		{
			scr_ChangeSprite(spriteSet.sprHurtShocked,true);
			
			scr_MKSS_ParticleSet_Spark(x,y,30);
		}
		else if (ds_list_find_index(MKSS_HurtElement,global.AttackTypeIDs[? "fire"]) != -1)
		{
			scr_ChangeSprite(spriteSet.sprHurtBurned,true);
		}
		else if (ds_list_find_index(MKSS_HurtElement,global.AttackTypeIDs[? "ice"]) != -1)
		{
			scr_ChangeSprite(spriteSet.sprHurtFrozen,true);
		}
		else
		{
			scr_ChangeSprite(spriteSet.sprHurtNormal,true);
		}
		#endregion
		
		#region Decrease Health
		var dmgFinal = targetAttack.dmg;
		
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
		
		scr_Debug_WriteLog(string(object_get_name(targetPlayer.object_index)) + " " + string_copy(string(targetPlayer.id),14,6) + " Received " + string(dmgFinal) + " Damage And " + string(finalKnockbackForce) + " Knockback At " + string(knockbackAngleFinal) + " Degrees From " + string(object_get_name(targetAttack.object_index)));
	}
}
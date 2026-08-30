///@description MKSS - Attack - Execute - Meta Knight - Parry Grand Wheelie

function scr_MKSS_Attack_Execute_MetaKnight_ParryGrandWheelie(playerIndex,currentParriedObject)
{
	show_debug_message(currentParriedObject)
	with (playerIndex)
	{
		attackString = global.MKSS_AttackList[attackIndex].ID;
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		#region Audio
		var sfx = scr_PlaySfx(snd_MKSS_WheelieSkid);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		#endregion
		
		#region Particles
		scr_MKSS_ParticleSet_Run(x + (16 * -dirX),y + 16,dirX);
		#endregion
		
		#region Owner Variables
		isAttacking = true;
		#endregion
	}
	
	#region Parry
	with (currentParriedObject)
	{
		if (!global.MKSS_MinibossIsStunned) scr_MKSS_Score_Add(250);
		scr_MKSS_SpawnMetaPoint(8,x,y,depth - 1,playerIndex,90);
		
		scr_MKSS_Enemy_Miniboss_Stun();
		scr_MKSS_Enemy_GetStunned(id);
		
		var sfx = scr_PlaySfx(snd_MKSS_EnemyHit);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		var sfx = scr_PlaySfx(snd_MKSS_Stun);
		audio_sound_pitch(sfx,random_range(.85,1.15));
		
		shakeX = 4;
		
		scr_Camera_SetScreenshake(4);
		
		script_execute(enemyGetHit,id,floor(MKSS_Base_EnemyHP_Miniboss / 8),3,90 - (45 * sign(x - playerIndex.x)),playerIndex,playerIndex.speedMultFinal);
	}
	#endregion
}
///@description MKSS - Attack - Execute - Meta Knight - Slide

function scr_MKSS_Attack_Execute_MetaKnight_ParryChunkyGordo(playerIndex,currentParriedObject)
{
	with (playerIndex)
	{
		attackString = global.MKSS_AttackList[attackIndex].ID;
		scr_Debug_WriteLog(string(object_get_name(object_index)) + " Used [" + attackString + "]");
		
		#region Audio
		var sfx = scr_PlaySfx(snd_MKSS_Slide);
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
		canBeParried = false;
		owner = playerIndex;
		shakeX = 1;
		shakeY = 1;
		
		sprite_index = spriteSet.sprParry;
		
		dirX = 1;
		if (playerIndex.x < x) dirX = -1;
		
		scr_Enemy_ChangeState_Step(id,scr_MKSS_Enemy_Gordo_AI_Bounce_Parry_Step);
	}
	#endregion
}
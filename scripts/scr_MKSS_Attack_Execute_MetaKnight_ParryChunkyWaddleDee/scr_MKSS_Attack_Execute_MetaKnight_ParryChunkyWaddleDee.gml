///@description MKSS - Attack - Execute - Meta Knight - Parry Chunky Waddle Dee

function scr_MKSS_Attack_Execute_MetaKnight_ParryChunkyWaddleDee(playerIndex,currentParriedObject)
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
		canHitChunky = true;
		
		owner = playerIndex;
		shakeX = 1;
		shakeY = 1;
		
		dirX *= -1;
		hsp = 3 * dirX;
		vsp = -1;
		grounded = false;
		
		hurtFrame = scr_WeightedRandomize(sprHurt);
		sprite_index = sprHurt[hurtFrame][0];
	}
	#endregion
}
///@description MKSS - Attack - Meta Knight - Parry Trappy Pearl - Pearl

function scr_MKSS_Attack_Execute_MetaKnight_ParryTrappyPearl(playerIndex,currentParriedObject)
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
	if (instance_exists(currentParriedObject))
	{
		with (instance_create_depth(currentParriedObject.x,currentParriedObject.y,depth,obj_MKSS_Attack))
		{
			target = currentParriedObject.owner;
			owner = playerIndex;
			isEnemy = false;
			dmg = -1;
			sprite_index = spr_MKSS_Attack_Trappy_Pearl;
			attackAIStep = scr_MKSS_Attack_MetaKnight_ParryTrappyPearl_Step;
		}
		
		with (currentParriedObject)
		{
			instance_destroy();
		}
	}
	#endregion
}
///@description MKSS - Attack - Execute - Meta Knight - Parry Marx Arrow

function scr_MKSS_Attack_Execute_MetaKnight_ParryMarxArrow(playerIndex,currentParriedObject)
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
			sprite_index = currentParriedObject.sprite_index;
			image_index = 5;
			imageSpeed = 0;
			spd = currentParriedObject.spdMax;
			angle = 90 - (45 * playerIndex.dirX);
			image_angle = angle;
			attackAIStep = scr_MKSS_Attack_MetaKnight_ParryMarxArrow_Step;
		}
		
		with (currentParriedObject)
		{
			instance_destroy();
		}
	}
	#endregion
}
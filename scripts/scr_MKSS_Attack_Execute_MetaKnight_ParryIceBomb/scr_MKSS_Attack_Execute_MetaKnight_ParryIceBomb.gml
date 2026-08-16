///@description MKSS - Attack - Execute - Meta Knight - Parry Ice Bomb

function scr_MKSS_Attack_Execute_MetaKnight_ParryIceBomb(playerIndex,currentParriedObject)
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
			with (target)
			{
				if (object_index == obj_MKSS_Enemy_StarlessMarx)
				{
					if (parryBack > 0)
					{
						scr_MKSS_UI_ParryIndicator_Create(x,y + 8,depth - 1,(point_distance(x,y,other.x,other.y)/8)+8);
					}
				}
			}
			owner = playerIndex;
			isEnemy = false;
			dmg = -1;
			sprite_index = currentParriedObject.sprite_index;
			attackAIStep = scr_MKSS_Attack_MetaKnight_IceBomb_Step;
		}
		
		with (currentParriedObject)
		{
			instance_destroy();
		}
	}
	#endregion
}
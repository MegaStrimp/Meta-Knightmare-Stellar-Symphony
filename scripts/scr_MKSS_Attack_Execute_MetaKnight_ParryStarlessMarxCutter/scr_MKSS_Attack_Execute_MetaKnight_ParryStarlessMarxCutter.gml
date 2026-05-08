///@description MKSS - Attack - Execute - Meta Knight - Parry Starless Marx Cutter

function scr_MKSS_Attack_Execute_MetaKnight_ParryStarlessMarxCutter(playerIndex,currentParriedObject)
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
			dirX = currentParriedObject.dirX;
			sprite_index = spr_MKSS_Attack_StarlessMarx_ShooterCutter;
			attackAIStep = scr_MKSS_Attack_MetaKnight_ParryStarlessMarxCutter_Step;
		}
		
		with (currentParriedObject)
		{
			var count = 0;
			with (obj_Attack)
			{
				if (owner == other.owner)
				{
					count += 1;
					if (count > 1) break;
				}
			}
				
			if (count <= 1)
			{
				with (owner)
				{
					shooterCutter_CancelTimer = shooterCutter_CancelTimerMax;
				}
			}
			
			instance_destroy();
		}
	}
	#endregion
}
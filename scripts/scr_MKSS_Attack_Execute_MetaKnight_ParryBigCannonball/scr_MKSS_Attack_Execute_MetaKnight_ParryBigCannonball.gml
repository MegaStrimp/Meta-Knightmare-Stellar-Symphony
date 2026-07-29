///@description MKSS - Attack - Execute - Meta Knight - Parry Big Cannonball

function scr_MKSS_Attack_Execute_MetaKnight_ParryBigCannonball(playerIndex,currentParriedObject)
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
		with (instance_create_layer(currentParriedObject.x,currentParriedObject.y,"BackgroundCannonballs",obj_MKSS_Attack))
		{
			target = currentParriedObject.owner;
			owner = playerIndex;
			isEnemy = false;
			dmg = -1;
			sprite_index = spr_MKSS_Attack_ChasseEmee_BigCannonball;
			attackAIStep = scr_MKSS_Attack_MetaKnight_ParryBigCannonball_Step;
			hsp = 0;
			vsp = -3;
			grav = .15;
			gravLimit = 3;
		}
		
		with (currentParriedObject)
		{
			instance_destroy();
		}
	}
	#endregion
}
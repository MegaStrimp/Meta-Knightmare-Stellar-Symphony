///@description MKSS - Attack - Execute - Meta Knight - Parry Andromeda Charge Shot

function scr_MKSS_Attack_Execute_MetaKnight_ParryAndromedaChargeShot(playerIndex,currentParriedObject)
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
		scr_MKSS_Score_Add(50);
		scr_MKSS_SpawnMetaPoint(3,x,y,depth - 1,playerIndex,90);
		
		scr_Camera_SetScreenshake(4);
		
		var i = 0;
		var amount = 6;
		var angleAmount = 360/amount;
		var startAngle = angleAmount;
		var length = 4;
		repeat(amount)
		{
			with (instance_create_depth(currentParriedObject.x + lengthdir_x(length,startAngle),currentParriedObject.y + lengthdir_y(length,startAngle),currentParriedObject.depth - 1,obj_MKSS_Attack))
			{
				owner = playerIndex;
				isEnemy = false;
				dmg = 1;
				bonusValue = MKSS_Base_AttackBonusValue;
				sprite_index = spr_MKSS_Attack_Andromeda1_ParryProjectile;
				mask_index = spr_MKSS_Attack_Andromeda1_ParryProjectile;
				scr_MKSS_Attack_Andromeda1_ParryProjectile_Setup();
				angle = startAngle;
				launchTimer += 6 * i;
				target = currentParriedObject.owner;
			}
			
			startAngle += angleAmount * obj_Player.dirX;
			i++;
		}
		
		with (currentParriedObject)
		{
			instance_destroy();
		}
	}
	#endregion
}
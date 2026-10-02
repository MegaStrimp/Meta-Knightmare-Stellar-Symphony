///@description MKSS - Attack - Andromeda 1 - Giant Sword Parry - Step

function scr_MKSS_Attack_Andromeda1_GiantSwordParry_Step()
{
	if (!localPause)
	{
		#region Get Stuck
		if (!stuck)
		{
			vsp = scr_Entity_Gravity(vsp,grav,gravLimit,speedMultFinal);
			
			image_angle = (image_angle + (rotateSpd * rotateDir) * speedMultFinal) % 360;
			if (image_angle < 0) image_angle += 360;
		
			if (vsp > 0) and (y >= yTarget) and (point_distance(image_angle,0,270,0) <= 30)
			{
				layer = layer_get_id("Collision");
				
				vsp = 0;
				
				scr_Camera_SetScreenshake(2,4);
				
				stuck = true;
			}
		}
		else
		{
			starTimer = max(starTimer - speedMultFinal,0);
			if (starTimer == 0)
			{
				var swordLength = 108;
				var i = 0;
				var amount = 12;
				var lengthAmount = swordLength/amount;
				var startLength = lengthAmount;
				repeat(amount)
				{
					var _x = x - lengthdir_x(swordLength / 2,image_angle) + lengthdir_x(startLength,image_angle);
					var _y = y - lengthdir_y(swordLength / 2,image_angle) + lengthdir_y(startLength,image_angle);
					with (instance_create_layer(_x,_y,"Enemies",obj_MKSS_Attack))
					{
						owner = other.owner;
						isEnemy = false;
						dmg = 1;
						bonusValue = MKSS_Base_AttackBonusValue;
						sprite_index = spr_MKSS_Attack_Andromeda1_ParryProjectile;
						mask_index = spr_MKSS_Attack_Andromeda1_ParryProjectile;
						scr_MKSS_Attack_Andromeda1_ParryProjectile_Setup();
						spd -= random_range(-.2,1.2);
						if (other.target.x > x) angle = 180;
						angle += irandom_range(-45,45);
						if (angle < 0) angle += 360;
						if (angle >= 360) angle -= 360;
						launchTimer += 6 * i;
						target = other.target;
					}
			
					startLength += lengthAmount;
					i++;
				}
				
				instance_destroy();
			}
		}
		#endregion
		
		#region Position
		scr_Component_SetPosition(hsp,vsp);
		#endregion
	}
}
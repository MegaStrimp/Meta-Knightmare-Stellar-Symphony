///@description MKSS - Attack - Nimbia - Kracklet - Step

function scr_MKSS_Attack_Nimbia_Kracklet_Step()
{
	if (!localPause)
	{
		#region Kracklet Movement
		if (movementTimer != -1)
		{
			movementTimer = max(movementTimer - speedMultFinal,0);
			if (movementTimer == 0)
			{
				var _dirX = choose(-1,0,1);
				if (x == movementLimit) _dirX = choose(0,1);
				if (x == room_width-movementLimit) _dirX = choose(0,-1);
				var _dirY = choose(-1,0,1);
				if (y == movementLimit) _dirY = choose(0,1);
				if (y == room_height-movementLimit) _dirY = choose(0,-1);
				if (instance_place(x,y,obj_Wall)) _dir = -1;
				
				x += irandom_range(movementRangeMin,movementRangeMax) * _dirX;
				y += irandom_range(movementRangeMin,movementRangeMax) * _dirY;
				
				x = clamp(x,movementLimit,room_width-movementLimit);
				y = clamp(y,movementLimit,room_height-movementLimit);
				
				var _dir = point_direction(xprevious,yprevious,x,y);
				var _len = point_distance(xprevious,yprevious,x,y);
				var _spdMax = 1;
				
				if (_len >= movementRangeMax/2)
				{
					repeat(8)
					{
						var _spd = -random_range(0,_spdMax);
						var _angleOffset = irandom_range(-4,4);
					
						scr_MKSS_ParticleSet_NimbiaCloud(xprevious + irandom_range(-16,16),yprevious + irandom_range(-16,16),lengthdir_x(_spd,_dir + _angleOffset),lengthdir_y(_spd,_dir + _angleOffset),0);
					}
				}
				
				repeat(ceil(_len/3))
				{
					var _range = irandom_range(4,_len-4);
					var _spd = -random_range(0,_spdMax);
					var _angleOffset = irandom_range(-4,4);
					
					scr_MKSS_ParticleSet_NimbiaCloud(xprevious + lengthdir_x(_range,_dir) + irandom_range(-2,2),yprevious + lengthdir_y(_range,_dir) + irandom_range(-2,2),lengthdir_x(_spd,_dir + _angleOffset),lengthdir_y(_spd,_dir + _angleOffset),1);
				}
				
				repeat(8)
				{
					var _spd = -random_range(0,_spdMax);
					var _angleOffset = irandom_range(-4,4);
					
					scr_MKSS_ParticleSet_NimbiaCloud(x + irandom_range(-16,16),y + irandom_range(-16,16),lengthdir_x(_spd,_dir + _angleOffset),lengthdir_y(_spd,_dir + _angleOffset),-1);
				}
				
				movementDmgCooldown = movementDmgCooldownMax;
				movementTimer = movementTimerMax + irandom_range(-movementTimerMaxAdd,movementTimerMaxAdd);
			}
		}
		#endregion
		
		#region Trigger
		var _trigger = false;
		if (movementDmgCooldown == -1)
		{
			if (spd == 0)
			{
				with (instance_place(x,y,obj_MKSS_Attack))
				{
					if (dmg)
					{
						//if (!isEnemy) _trigger = true;
						//else if (object_index != other.object_index) and (owner == other.owner)
						//{
						//	_trigger = true;
						//}
						_trigger = true;
					}
				}
				if (instance_place(x,y,obj_MKSS_Player)) or (instance_place(x,y,obj_MKSS_Enemy_Nimbia)) _trigger = true;
			}
		}
		else
		{
			movementDmgCooldown = max(movementDmgCooldown - speedMultFinal,0);
			if (movementDmgCooldown == 0)
			{
				movementDmgCooldown = -1;
			}
		}
		
		if (_trigger)
		{
			var i = 0;
			repeat(4)
			{
				var _angle = 45+(90*i);
				with (instance_create_depth(x + lengthdir_x(4,_angle),y +  + lengthdir_y(4,_angle),depth + 1,obj_MKSS_Attack))
				{
					owner = other.owner;
					isEnemy = true;
					dmg = 1;
					sprite_index = spr_MKSS_Attack_Nimbia_KrackletNeedle;
					mask_index = spr_MKSS_Attack_Nimbia_KrackletNeedle;
					attackAIStep = scr_MKSS_Attack_Nimbia_KrackletNeedle_Step;
					angle = _angle;
					spd = 3;
					image_angle = angle;
					destroyOutsideRoom = true;
					destroyAfterCollideWall = true;
				}
				i++;
			}
			
			repeat(24)
			{
				scr_MKSS_ParticleSet_NimbiaCloud(x + irandom_range(-16,16),y + irandom_range(-16,16),,,-1);
			}
			
			owner.krackletAmount--;
			
			instance_destroy();
		}
		#endregion
		
		#region Position		
		hsp = lengthdir_x(spd,angle);
		vsp = lengthdir_y(spd,angle);		
		scr_Component_SetPosition(hsp,vsp);
		spd = scr_Entity_Friction(spd,decel * speedMultFinal);
		#endregion
	}
}